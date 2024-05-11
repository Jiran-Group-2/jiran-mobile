import 'package:get/get.dart';

import '../controllers/announcement_detail_controller.dart';

class AnnouncementDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementDetailController>(
      () => AnnouncementDetailController(),
    );
  }
}
