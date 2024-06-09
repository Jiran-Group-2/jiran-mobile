import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/formatter.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/widget/badge.dart';

import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  const ComplaintDetailView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.complaintModel.value.complaintSubject ?? 'Title'),
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
                  AutoSizeText(controller.complaintModel.value.complaintSubject ?? 'Title', 
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText(dateTimeFormat.format(controller.complaintModel.value.createdDate!), 
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                  StatusBadge(status: controller.complaintModel.value.status!),
                  const SizedBox(height: 24),

                  AutoSizeText(controller.complaintModel.value.complaintDescription ?? 'Description',
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                    minFontSize: 8,
                  ),

                  Obx(
                    () => controller.complaintModel.value.attachmentId == null || controller.complaintModel.value.attachmentId == 0  ? const SizedBox.shrink() : Column(
                      children: [
                        const SizedBox(height: 24),
                        
                        const AutoSizeText('Attachments', 
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          minFontSize: 12,
                          maxLines: 2,
                        ),
                        
                        CarouselSlider(
                          items: const [
                            CarouselImage(url: 'https://www.aqualeisurepoolsandspas.com/wp-content/uploads/2022/10/dirty-pool.jpg'),
                            CarouselImage(url: 'https://t4.ftcdn.net/jpg/02/55/03/21/360_F_255032171_lPheQiVyW3BsdRKBe7yunicAERfVHh6t.jpg'),
                            CarouselImage(url: 'https://st.depositphotos.com/1000270/2590/i/450/depositphotos_25902385-stock-photo-filthy-backyard-swimming-pool-and.jpg'),
                          ],
                          options: CarouselOptions(
                            autoPlay: true,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                          ),
                        ),
                      ],
                    ),
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

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(url))
      ),
    );
  }
}