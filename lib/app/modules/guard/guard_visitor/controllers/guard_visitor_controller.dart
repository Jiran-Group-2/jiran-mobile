import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/visitor_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/app/data/providers/visitor_providers.dart';
import 'package:jiran_app/controller_export.dart';

class GuardVisitorController extends GetxController {
  
  StorageProvider sp = Get.find<StorageProvider>();
  VisitorProvider visitorProvider = Get.find<VisitorProvider>();
  RxList<VisitorModel> visitors = RxList<VisitorModel>();

  @override
  void onInit() {
    super.onInit();
    getVisitors();
  }

  getVisitors() async {
    EasyLoading.show();
    var response = await visitorProvider.getVisitors();

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    visitors.value = response;
    EasyLoading.dismiss();
  }
}