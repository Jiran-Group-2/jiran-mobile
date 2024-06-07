import 'package:get/get.dart';

import '../controllers/guard_visitor_details_controller.dart';

class GuardVisitorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuardVisitorDetailsController>(
      () => GuardVisitorDetailsController(),
    );
  }
}
