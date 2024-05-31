import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/formatter.dart';
import 'package:jiran_app/app/core/theme.dart';

import '../controllers/announcement_detail_controller.dart';

class AnnouncementDetailView extends GetView<AnnouncementDetailController> {
  const AnnouncementDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.announcement.value.announcementSubject ?? 'Title'),
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
                  AutoSizeText(controller.announcement.value.announcementSubject ?? 'Title', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText('Post Date: ${dateOnlyFormat.format(controller.announcement.value.createdDate!)}', 
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                  const SizedBox(height: 24),

                  AutoSizeText(controller.announcement.value.announcementDescription ?? 'Description.', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
