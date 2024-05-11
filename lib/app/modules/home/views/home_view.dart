import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jiran.', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: AppColors.grey)
                  ),
                  child: const Icon(Icons.notifications_none_outlined),
                ),
                const SizedBox(width: 8,),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: AppColors.grey)
                  ),
                  child: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BillsCard(controller: controller),
          const SizedBox(height: 16,),
          HomeMenu(controller: controller),
          const SizedBox(height: 16,),
          AnnouncementCarousel(controller: controller),
        ],
      ),
    );
  }
}

class BillsCard extends StatelessWidget {
  const BillsCard({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText('Your current bills are:', style: TextStyle(color: AppColors.white, fontSize: 8, fontWeight: FontWeight.bold),),
                  const AutoSizeText('RM 50.55', style: TextStyle(color: AppColors.white, fontSize: 38, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.BILLS),
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Center(child: AutoSizeText('Pay Now', style: TextStyle(color: AppColors.white, fontSize: 8, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
              child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              height: double.infinity,
              width: double.infinity,
              color: AppColors.primary,
            )
          ),
        ],
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText('Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        const SizedBox(height: 8),

        GridView.count(
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          shrinkWrap: true,
          children: [
            MenuButtonWidget(
              title: 'Bills',
              icon: const Icon(Icons.payment_outlined, size: 40),
              onTap: () => Get.toNamed(Routes.BILLS),
            ),
            MenuButtonWidget(
              title: 'Visitors',
              icon: const Icon(Icons.people, size: 40),
              onTap: () => Get.toNamed(Routes.VISITOR),
            ),
            MenuButtonWidget(
              title: 'Complaints',
              icon: const Icon(Icons.announcement_outlined, size: 40,),
              onTap: () => Get.toNamed(Routes.COMPLAINT),
            ),
            MenuButtonWidget(
              title: 'Announcements',
              icon: const Icon(Icons.chat, size: 40,),
              onTap: () => Get.toNamed(Routes.ANNOUNCEMENT),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({super.key, this.title, this.icon, this.onTap});

  final String? title;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title ?? 'Item',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                      icon ?? const Icon(Icons.ac_unit, size: 60),
                    ],
                  ),
                ),
              ),
              AutoSizeText(
                title ?? 'Item', textAlign: TextAlign.center, maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnnouncementCarousel extends StatelessWidget {
  const AnnouncementCarousel({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText('Announcements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        const SizedBox(height: 16),

        Container(
          height: 300,
          decoration: BoxDecoration(
            color: AppColors.tertiary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: CarouselSlider(
            items: [
              AnnouncementWidget(controller: controller),
              AnnouncementWidget(controller: controller),
              AnnouncementWidget(controller: controller),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
        ),
      ],
    );
  }
}

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ANNOUNCEMENT),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          margin: const EdgeInsets.all(24),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                'Water Disruption',
                style: TextStyle(
                  color: AppColors.tertiary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 2.5,
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  'Ingin dimaklumkan bahawa kerja penambahbaikan aset kritikal di Loji Rawatan Air Sungai Selangor Fasa 1 (LRA SSP1) sedang dijalankan.',
                  style: TextStyle(
                    color: AppColors.tertiary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  minFontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}