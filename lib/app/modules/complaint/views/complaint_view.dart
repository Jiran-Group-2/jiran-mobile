import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/formatter.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:jiran_app/app/widget/badge.dart';
import 'package:jiran_app/app/widget/list_tile.dart';

import '../controllers/complaint_controller.dart';


class ComplaintView extends GetView<ComplaintController> {
  const ComplaintView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(        
        child: RefreshIndicator(
          onRefresh: () => controller.getComplaints(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText('Your Complaints', 
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    AutoSizeText('Improvements that you suggested.', 
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
                itemCount: controller.complaints.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return StatusListTile(
                    title: '${controller.complaints[index].complaintSubject}',
                    subtitle: dateTimeFormat.format(controller.complaints[index].createdDate!),
                    status: StatusBadge(status: controller.complaints[index].status!),
                    onTap: () => Get.toNamed(Routes.COMPLAINT_DETAIL, arguments: controller.complaints[index].obs),
                  );
                }
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.COMPLAINT_ADD)!.then((value) {
          if (value != null) {
            controller.getComplaints();
          }
        }),
        backgroundColor: AppColors.primary,
        tooltip: 'Add new complaint',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}