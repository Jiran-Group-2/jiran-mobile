import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/announcement_model.dart';

class AnnouncementDetailController extends GetxController {
  late Rx<AnnouncementModel> announcement;

  @override
  void onInit() {
    super.onInit();
    announcement = Get.arguments;
  }
}
