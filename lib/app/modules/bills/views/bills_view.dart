import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:jiran_app/app/widget/list_tile.dart';

import '../controllers/bills_controller.dart';

class BillsView extends GetView<BillsController> {
  const BillsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills & Payments'),
        elevation: 0,
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: AppColors.secondary,
            child: TabBar(
              controller: controller.tabController,
              labelColor: AppColors.white,
              dividerColor: AppColors.white,
              indicatorColor: AppColors.white,
              unselectedLabelColor: AppColors.white.withOpacity(0.6),
              tabs: const [
                Tab(text: 'Pending'),
                Tab(text: 'Paid'),
              ],
              indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 2, color: Colors.white)),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          BillsListView(controller: controller, bills: controller.pendingBills, isPending: true),
          BillsListView(controller: controller, bills: controller.paidBills, isPending: false),
        ]
      )
    );
  }
}

class BillsListView extends StatelessWidget {
  const BillsListView({super.key, required this.controller, required this.bills, required this.isPending});

  final BillsController controller;
  final RxList<BillModel> bills;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RefreshIndicator(
        onRefresh: () => controller.getBills(),
        // ignore: prefer_is_empty
        child: Obx(() => bills.length != 0 ?ListView.builder(
          itemCount: bills.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final b = bills[index]; 
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.BILLS_DETAIL, arguments: b.obs)!.then((value) {
                if (value != null) {
                  controller.getBills();
                }
              }),
              child: BillsListTile(bill: b),
            );
          }
        ) : const Center(child: Text('No bills here'),)),
      ),
    );
  }
}