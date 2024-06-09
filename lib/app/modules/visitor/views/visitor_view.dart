import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:jiran_app/app/widget/badge.dart';
import 'package:jiran_app/app/widget/list_tile.dart';

import '../controllers/visitor_controller.dart';

class VisitorView extends GetView<VisitorController> {
  const VisitorView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitors'),
        elevation: 0,
        centerTitle: false,
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
                    const AutoSizeText('Upcoming Visitors', 
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    AutoSizeText('Get your house ready!', 
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
                itemBuilder: (context, index) {
                  return StatusListTile(
                    title: controller.visitors[index].visitorVehiclePlate,
                    subtitle: controller.visitors[index].visitorPurposeOfVisit,
                    status: StatusBadge(status: controller.visitors[index].approvalStatus!),
                    onTap: () => Get.toNamed(Routes.VISITOR_DETAIL, arguments: controller.visitors[index].obs),
                  );
                }
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.VISITOR_ADD)!.then((value) {
          if (value != null) {
            controller.getVisitors();
          }
        }),
        backgroundColor: AppColors.primary,
        tooltip: 'Add new visitor',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
