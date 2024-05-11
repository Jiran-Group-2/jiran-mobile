import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
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
      body: Column(
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
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const AppListTile(
                title: 'Water Disruption',
                subtitle: 'Post Date: 03rd May 2024',
              );
            }
          ),
        ],
      ),
    );
  }
}
