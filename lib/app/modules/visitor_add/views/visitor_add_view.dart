import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/widget/button.dart';
import 'package:jiran_app/app/widget/form.dart';

import '../controllers/visitor_add_controller.dart';

class VisitorAddView extends GetView<VisitorAddController> {
  const VisitorAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register Visitor'),
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
                    const AutoSizeText('Register Visitor', 
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      minFontSize: 12,
                      maxLines: 2,
                    ),
                    AutoSizeText('Get your house ready!', 
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
                        children: [
                          AppTextField(
                            controller: controller.visitorNameController,
                            title: 'Name',
                            hintText: 'Enter name',
                            isRequired: true,
                          ),
          
                          AppTextField(
                            controller: controller.visitorMobileNoController,
                            title: 'Phone',
                            hintText: 'Enter phone number',
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              // Limit only 11 digit max, 9 digit min
                              LengthLimitingTextInputFormatter(11),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            isRequired: true,
                            minLength: 9,
                          ),
          
                          AppTextField(
                            controller: controller.visitorNRICController,
                            title: 'NRIC',
                            hintText: 'Enter NRIC',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(12),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            isRequired: true,
                          ),
          
                          AppTextField(
                            controller: controller.quantityController,
                            title: 'Quantity',
                            hintText: 'Enter quantity',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                            ],
                          ),
          
                          AppTextField(
                            controller: controller.purposeOfVisitController,
                            title: 'Purpose of visit',
                            hintText: 'Enter purpose of visit',
                            isRequired: true,
                          ),
          
                          AppTextField(
                            controller: controller.plateNoController,
                            title: 'Plate number',
                            hintText: 'Enter plate number',
                            isRequired: true,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
      
                          const SizedBox(height: 24),
                          AppButtonRounded(
                            onTap: () => controller.registerVisitor(),
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
