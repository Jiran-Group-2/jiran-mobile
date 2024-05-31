import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/visitor_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/app/data/providers/visitor_providers.dart';
import 'package:jiran_app/controller_export.dart';

class VisitorAddController extends GetxController {
  StorageProvider sp = Get.find<StorageProvider>();
  VisitorProvider visitorProvider = Get.find<VisitorProvider>();
  TextEditingController visitorNameController = TextEditingController();
  TextEditingController visitorMobileNoController = TextEditingController();
  TextEditingController visitorNRICController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController purposeOfVisitController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController(text: '1');
  TextEditingController plateNoController = TextEditingController();
  
  VisitorRequestModel? visitor;
  final formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
  }

  registerVisitor() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    visitor = VisitorRequestModel(
      providedVisitorName: visitorNameController.text,
      providedVisitorMobileNo: visitorMobileNoController.text,
      providedVisitorNRIC: visitorNRICController.text,
      providedQuantity: int.parse(quantityController.text),
      providedPurposeOfVisit: purposeOfVisitController.text,
      providedVehicleType: int.parse('1'),
      providedPlateNo: plateNoController.text,
      providedUnitNumberID: sp.getUser()!.unitNumberId!,
      providedCreatedByID: sp.getUser()!.userId!,
    );

    var response = await visitorProvider.registerVisitor(visitor!);

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