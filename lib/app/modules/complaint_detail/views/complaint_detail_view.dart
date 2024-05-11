import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';

import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  const ComplaintDetailView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pool too Dirty'),
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
                  const AutoSizeText('Pool too Dirty', 
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText('12th May 2024', 
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),
                  const SizedBox(height: 24),


                  const AutoSizeText('The pool water appears to be excessively murky, indicating a lack of proper filtration and maintenance. Additionally, debris such as leaves, twigs, and even insects are frequently found floating on the surface, suggesting inadequate cleaning procedures.\n\nThis situation not only compromises the aesthetic appeal of the pool but also raises alarming health concerns, as dirty water can harbor harmful bacteria and pathogens, exposing swimmers to various infections and illnesses. Moreover, the pool surroundings, including the deck area and changing rooms, exhibit signs of neglect and poor upkeep.  In conclusion, I request your prompt attention to this matter and appreciate your efforts in resolving it effectively.\n\nThe health and well-being of our community are at stake, and I trust that together we can work towards restoring the pool to its former state of cleanliness and ensuring a pleasant experience for all residents.', 
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 10,
                    ),
                    minFontSize: 8,
                  ),

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