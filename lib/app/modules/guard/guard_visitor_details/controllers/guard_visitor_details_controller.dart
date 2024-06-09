import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/visitor_model.dart';
import 'package:jiran_app/app/data/providers/visitor_providers.dart';
import 'package:jiran_app/controller_export.dart';

class GuardVisitorDetailsController extends GetxController {
  VisitorProvider visitorProvider = Get.find<VisitorProvider>();
  late Rx<VisitorModel> visitor;

  @override
  void onInit() {
    super.onInit();
    visitor = Get.arguments;
  }

  updateVisitorConfirmation(bool isApproved) async {
    showCupertinoDialog(context: Get.context!, builder: (context) {
      return CupertinoAlertDialog(
        title: Text(isApproved ? 'Approve Visitor' : 'Reject Visitor'),
        content: const Text('Proceed with the action?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Get.back();
              return;
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Get.back();
              updateVisitor(isApproved);
            },
            child: Text(isApproved ? 'Approve' : 'Reject'),
          ),
        ],
      );
    });
  }

  updateVisitor(bool isApproved) async {

    EasyLoading.show();
    VisitorUpdateModel v = VisitorUpdateModel(
      providedVisitorID: visitor.value.visitorId,
      providedVisitorName: visitor.value.visitorName,
      providedVisitorMobileNo: visitor.value.visitorMobileNo,
      providedVisitorNRIC: visitor.value.visitorNric,
      providedQuantity: visitor.value.visitorQuantity,
      providedPurposeOfVisit: visitor.value.visitorPurposeOfVisit,
      providedVehicleType: visitor.value.visitorVehicleType,
      providedPlateNo: visitor.value.visitorVehiclePlate,
      providedUnitNumberID: visitor.value.unitNumberId,
      providedCreatedByID: visitor.value.createdById,
      providedStatus: isApproved ? 'A' : 'I',
    );

    var response = await visitorProvider.updateVisitor(v);

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    Get.back(result: response as bool);
    AppSnackbar.successSnackbar('Visitor updated successfully');
    EasyLoading.dismiss();
  }
}