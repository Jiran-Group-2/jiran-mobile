import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/complaint_model.dart';
import 'package:jiran_app/controller_export.dart';

class ComplaintDetailController extends GetxController {
  late Rx<ComplaintModel> complaintModel;
  
  @override
  void onInit() {
    super.onInit();
    complaintModel = Get.arguments;
    appLogger(complaintModel.value.attachmentId);
  }

}
