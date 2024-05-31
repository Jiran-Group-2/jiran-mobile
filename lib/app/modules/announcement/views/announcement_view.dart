import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/formatter.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:jiran_app/app/widget/list_tile.dart';

import '../controllers/announcement_controller.dart';

class AnnouncementView extends GetView<AnnouncementController> {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => controller.getAnnouncements(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText('Latest Announcements', 
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    AutoSizeText('This is what\'s happening, Doe.', 
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
                itemCount: controller.announcements.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppListTile(
                    title: '${controller.announcements[index].announcementSubject}',
                    subtitle: dateTimeFormat.format(controller.announcements[index].createdDate!),
                    onTap: () => Get.toNamed(Routes.ANNOUNCEMENT_DETAIL, arguments: controller.announcements[index].obs),
                  );
                }
              )),
            ],
          ),
        ),
      ),
    );
  }
}
