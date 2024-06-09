import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/widget/badge.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/visitor_detail_controller.dart';

class VisitorDetailView extends GetView<VisitorDetailController> {
  const VisitorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor QR'),
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
                  StatusBadge(status: controller.visitor.value.approvalStatus ?? 'U', fontSize: 12, borderRadius: 4),
                  AutoSizeText(controller.visitor.value.visitorVehiclePlate ?? 'Plate Number', 
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 18,
                    maxLines: 2,
                  ),
                  AutoSizeText(controller.visitor.value.visitorName ?? 'Visitor Name', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                    minFontSize: 8,
                  ),
                  AutoSizeText(controller.visitor.value.visitorVehicle ?? '(Vehicle not specified)',
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 14,
                    ),
                    minFontSize: 8,
                  ),                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: QrImageView(
                  data: controller.visitor.value.visitorId?.toString() ?? '0',
                  size: 250,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
