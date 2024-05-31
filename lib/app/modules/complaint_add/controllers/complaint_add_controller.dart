import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/complaint_model.dart';
import 'package:jiran_app/app/data/providers/complaint_providers.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/controller_export.dart';

class ComplaintAddController extends GetxController {

  StorageProvider sp = Get.find<StorageProvider>();
  ComplaintProvider complaintProvider = Get.find<ComplaintProvider>();

  RxList<ComplaintCategoryModel> complaints = RxList<ComplaintCategoryModel>();

  TextEditingController complaintCategoryIDController = TextEditingController();
  TextEditingController complaintLocationController = TextEditingController();
  TextEditingController complaintSubjectController = TextEditingController();
  TextEditingController complaintDescriptionController = TextEditingController();

  Rx<ComplaintCategoryModel> selectedComplaintCategory = ComplaintCategoryModel().obs;
  ComplaintRequestModel? complaint;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getComplaintCategory();
  }

  getComplaintCategory() async {
    EasyLoading.show();
    var response = await complaintProvider.getComplaintCategory();

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    complaints.value = response;
    selectedComplaintCategory.value = complaints[0];
    EasyLoading.dismiss();
  }

  createComplaint() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    EasyLoading.show();

    complaint = ComplaintRequestModel(
      providedUserID: sp.getUser()!.userId!,
      providedComplaintCategoryID: selectedComplaintCategory.value.complaintCategoryId!,
      providedComplaintLocation: complaintLocationController.text,
      providedComplaintSubject: complaintSubjectController.text,
      providedComplaintDescription: complaintDescriptionController.text,
      providedSystemID: sp.getUser()!.systemId!,
    );
    
    var response = await complaintProvider.createComplaint(complaint!);

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    Get.back(result: true);
    EasyLoading.dismiss();
  }
  
}
