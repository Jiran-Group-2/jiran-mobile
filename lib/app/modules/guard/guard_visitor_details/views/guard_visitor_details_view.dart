import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/widget/badge.dart';
import 'package:jiran_app/app/widget/button.dart';

import '../controllers/guard_visitor_details_controller.dart';

class GuardVisitorDetailsView extends GetView<GuardVisitorDetailsController> {
  const GuardVisitorDetailsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Details'),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(controller.visitor.value.visitorVehiclePlate ?? 'Plate Number', 
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),

                  // foreach variable in VisitorModel, build VisitorItemWidget
                  // ...controller.visitor.value.toJson().entries.map((e) => VisitorItemWidget(title: e.key, description: '${e.value}')).toList(),
                  VisitorItemWidget(title: 'Name', description: controller.visitor.value.visitorName ?? 'Name'),
                  VisitorItemWidget(title: 'Unit No.', description: '${controller.visitor.value.unitNumberId ?? 0}'),
                  VisitorItemWidget(title: 'Mobile No.', description: controller.visitor.value.visitorMobileNo ?? 'Mobile No.'),
                  VisitorItemWidget(title: 'Vehicle No.', description: controller.visitor.value.visitorVehiclePlate ?? 'Vehicle No.'),
                  VisitorItemWidget(title: 'Persons', description: '${controller.visitor.value.visitorQuantity ?? 0}'),
                  VisitorItemWidget(title: 'Purpose', description: controller.visitor.value.visitorPurposeOfVisit ?? 'Purpose'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText('Status',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                        ),
                        minFontSize: 8,
                      ),
                      StatusBadge(status: controller.visitor.value.approvalStatus ?? 'U', fontSize: 16, borderRadius: 8),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => controller.visitor.value.approvalStatus == 'P' ? Container(
          height: 100,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppButtonRounded(
                    title: 'Reject',
                    color: AppColors.red,
                    onTap: () {},
                    borderRadius: 8,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: AppButtonRounded(
                    title: 'Approve',
                    color: AppColors.green,
                    onTap: () {},
                    borderRadius: 8,
                  ),
                ),
              ],
            ),
          ),
        ) : const SizedBox.shrink(),
      ),
    );
  }
}

class VisitorItemWidget extends StatelessWidget {
  const VisitorItemWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(title,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 12,
          ),
          minFontSize: 8,
        ),
        AutoSizeText(description,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
          ),
          minFontSize: 8,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}