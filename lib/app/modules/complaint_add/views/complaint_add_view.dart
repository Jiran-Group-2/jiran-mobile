import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/widget/button.dart';
import 'package:jiran_app/app/widget/form.dart';

import '../controllers/complaint_add_controller.dart';

class ComplaintAddView extends GetView<ComplaintAddController> {
  const ComplaintAddView({super.key});
  
  @override
  Widget build(BuildContext context) {return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log a Complaint'),
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
                    const AutoSizeText('Log a Complaint', 
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
                          const AutoSizeText('Category', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 8),
                          Obx(() => DropdownButtonFormField(
                            value: controller.selectedComplaintCategory.value,
                            items: controller.complaints.map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.categoryName ?? 'Category'),
                            )).toList(),
                            onChanged: (e) => controller.selectedComplaintCategory.value = e!,
                            validator: (e) => e == null ? 'Choose a category' : null,
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
                            controller: controller.complaintLocationController,
                            title: 'Location',
                            hintText: 'Where do this thing happen?',
                            keyboardType: TextInputType.phone,
                            isRequired: true,
                          ),
          
                          AppTextField(
                            controller: controller.complaintSubjectController,
                            title: 'Subject',
                            hintText: 'Your subject here',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),
          
                          AppTextField(
                            controller: controller.complaintDescriptionController,
                            title: 'Description',
                            hintText: 'Your description here',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),      
      
                          const SizedBox(height: 24),
                          AppButtonRounded(
                            onTap: () => controller.createComplaint(),
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
