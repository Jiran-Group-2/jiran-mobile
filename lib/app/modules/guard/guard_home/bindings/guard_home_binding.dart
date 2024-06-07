import 'package:get/get.dart';

import '../controllers/guard_home_controller.dart';

class GuardHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuardHomeController>(
      () => GuardHomeController(),
    );
  }
}
