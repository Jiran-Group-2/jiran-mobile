import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/widget/button.dart';
import 'package:jiran_app/app/widget/form.dart';

import '../controllers/pay_sim_amount_controller.dart';

class PaySimAmountView extends GetView<PaySimAmountController> {
  const PaySimAmountView({super.key});
  @override
  Widget build(BuildContext context) {return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          elevation: 0,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText('Payment', 
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    AutoSizeText('Your voice matters!', 
                      style: TextStyle(
                        color: AppColors.grey.shade600,
                        fontSize: 10,
                      ),
                      minFontSize: 8,
                    ),
                    const SizedBox(height: 24),
          
                    Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AutoSizeText('Banks', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 8),
                          Obx(() => DropdownButtonFormField(
                            isExpanded: true,
                            value: controller.selectedBank.value,
                            items: controller.banks.map((b) => DropdownMenuItem(
                              value: b,
                              child: Text(b.name),
                            )).toList(),
                            onChanged: (b) => controller.selectedBank.value = b!,
                            validator: (b) => b == null ? 'Choose a bank' : null,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )),
                          const SizedBox(height: 24),
          
                          AppTextField(
                            controller: controller.makePaymentController,
                            title: 'Payment',
                            hintText: 'Your payment here',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),
         
      
                          const SizedBox(height: 24),
                          AppButtonRounded(
                            onTap: () => controller.payBill(),
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
          
          
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}