import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
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
                Tab(text: 'Bills'),
                Tab(text: 'History'),
              ],
              indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 2, color: Colors.white)),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          BillsListView(controller: controller, isHistory: false),
          BillsListView(controller: controller, isHistory: true),
        ]
      )
    );
  }
}

class BillsListView extends StatelessWidget {
  const BillsListView({super.key, required this.controller, required this.isHistory});

  final BillsController controller;
  final bool isHistory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const BillsListTile();
        }
      ),
    );
  }
}