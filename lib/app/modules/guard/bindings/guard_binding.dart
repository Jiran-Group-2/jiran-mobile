import 'package:get/get.dart';

import '../controllers/guard_controller.dart';

class GuardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuardController>(
      () => GuardController(),
    );
  }
}
