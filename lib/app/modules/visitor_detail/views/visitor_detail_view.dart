import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
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
                  const AutoSizeText('UTM 2913', 
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  const AutoSizeText('MyVi 2024, Silver', 
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                  AutoSizeText('3 hours stay', 
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                ],
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
                  data: 'https://youtu.be/dQw4w9WgXcQ?si=-64FRvJnUtAXVf08',
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
