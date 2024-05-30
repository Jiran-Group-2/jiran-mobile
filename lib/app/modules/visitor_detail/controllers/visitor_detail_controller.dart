import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/visitor_model.dart';

class VisitorDetailController extends GetxController {
  late Rx<VisitorModel> visitor;

  @override
  void onInit() {
    super.onInit();
    visitor = Get.arguments;
  }
}
