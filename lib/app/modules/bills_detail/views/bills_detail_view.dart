import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/formatter.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/routes/app_pages.dart';

import '../controllers/bills_detail_controller.dart';

class BillsDetailView extends GetView<BillsDetailController> {
  const BillsDetailView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(controller.bill.value.bill!.billSubject ?? 'Pay Bills'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: 
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
                  const AutoSizeText('Payment Summary', 
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    minFontSize: 12,
                    maxLines: 2,
                  ),
                  AutoSizeText('This bills is for ${monthYearFormat.format(DateTime.now())}', 
                    style: TextStyle(
                      color: AppColors.grey.shade600,
                      fontSize: 14,
                    ),
                    minFontSize: 8,
                  ),
                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: controller.isPending.value ? AppColors.orange : AppColors.green,
                    ),
                    child: AutoSizeText(controller.isPending.value ? 'Pending Payment' : 'Paid'),

                  ),
                  const SizedBox(height: 24),

                  BillItemWidget(
                    title: controller.bill.value.bill!.billSubject ?? 'Pay Bills',
                    description: 'RM ${controller.bill.value.amount ?? 0.00}',
                  ),

                  // Straight line
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 1,
                    width: double.infinity,
                    color: AppColors.grey.shade300,
                  ),
                  const SizedBox(height: 8),

                  BillItemWidget(
                    title: 'Amount',
                    description: 'RM ${controller.bill.value.amount?.toStringAsFixed(2) ?? 0.00.toStringAsFixed(2)}',
                  ),
                  BillItemWidget(
                    title: 'Paid',
                    description: 'RM ${controller.bill.value.paid?.toStringAsFixed(2) ?? 0.00.toStringAsFixed(2)}',
                  ),

                  // Straight line
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 1,
                    width: double.infinity,
                    color: AppColors.grey.shade300,
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText('Total Amount',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            minFontSize: 8,
                          ),
                          AutoSizeText('Overall price calculations',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                            ),
                            minFontSize: 8,
                          ),
                        ],
                      ),
                      AutoSizeText('RM ${controller.bill.value.balance?.toStringAsFixed(2) ?? 0.00.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        minFontSize: 8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
      ),
      bottomNavigationBar: controller.bill.value.isPending!.value ? SafeArea(
        child: SizedBox(
          height: 100,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(child: Row(
                  children: [
                    Icon(Icons.security_rounded, color: AppColors.primary, size: 32),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText('All your data are safe',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          AutoSizeText('Seamless payment',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 8,
                            ),
                          ),
                      ],
                    )
                  ],
                )),
                ElevatedButton(
                  onPressed: () => Get.offAndToNamed(Routes.PAY_SIM_AMOUNT, arguments: controller.bill),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary
                  ),
                  child: const Text('Pay', style: TextStyle(color: AppColors.white)),
                ),
              ],
            ),
          ),
        ),
        ) : const SizedBox.shrink(),
    );
  }
}

class BillItemWidget extends StatelessWidget {
  const BillItemWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(title,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
              ),
              minFontSize: 8,
            ),
            AutoSizeText(description,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
              ),
              minFontSize: 8,
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}