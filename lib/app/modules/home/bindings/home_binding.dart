import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/announcement_providers.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => AnnouncementProvider());
  }
}
