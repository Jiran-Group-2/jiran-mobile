import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/announcement_providers.dart';

import '../controllers/announcement_controller.dart';

class AnnouncementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementController>(
      () => AnnouncementController(),
    );
    Get.lazyPut(() => AnnouncementProvider());
  }
}
