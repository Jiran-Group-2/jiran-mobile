import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:jiran_app/app/widget/badge.dart';
import 'package:jiran_app/app/widget/list_tile.dart';
import 'package:jiran_app/app/widget/menu.dart';

import '../controllers/guard_home_controller.dart';

class GuardHomeView extends GetView<GuardHomeController> {
  const GuardHomeView({super.key});
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jiran.', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(context: context, builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Log out'),
                        content: const Text('Proceed with logging out?'),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Cancel'),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              StorageProvider sp = Get.find<StorageProvider>();
                              sp.logout();
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(color: AppColors.grey)
                    ),
                    child: const Icon(Icons.logout),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => controller.getVisitors(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText('Visitors', 
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    AutoSizeText('Please ensure that all visitors are scanned.', 
                      style: TextStyle(
                        color: AppColors.grey.shade600,
                        fontSize: 10,
                      ),
                      minFontSize: 8,
                    ),
                  ],
                ),
              ),
              Obx(() => ListView.builder(
                itemCount: controller.visitors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return StatusListTile(
                    title: controller.visitors[index].visitorVehiclePlate,
                    subtitle: controller.visitors[index].visitorPurposeOfVisit,
                    status: StatusBadge(status: controller.visitors[index].approvalStatus!),
                    onTap: () => Get.toNamed(Routes.GUARD_VISITOR_DETAILS, arguments: controller.visitors[index].obs)!.then((value) {
                      if (value != null) {
                        controller.onRefresh();
                      }
                    }),
                  );
                }
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.GUARD_VISITOR_SCAN, arguments: controller.visitors)!.then((value) {
          if (value != null) {
            controller.getVisitors();
          }
        }),
        backgroundColor: AppColors.primary,
        tooltip: 'Scan QR',
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_2, color: AppColors.white),
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText('Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        const SizedBox(height: 8),

        GridView.count(
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          shrinkWrap: true,
          children: [
            MenuButtonWidget(
              title: 'Visitors',
              icon: const Icon(Icons.people, size: 40),
              onTap: () => Get.toNamed(Routes.GUARD_VISITOR),
            ),
          ],
        ),
      ],
    );
  }
}