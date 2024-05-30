import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/complaint_model.dart';

class ComplaintDetailController extends GetxController {
  late Rx<ComplaintModel> complaintModel;
  
  @override
  void onInit() {
    complaintModel = Get.arguments;
    super.onInit();
  }

}
