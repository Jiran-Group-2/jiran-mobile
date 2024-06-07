import 'package:get/get.dart';

import '../controllers/guard_visitor_scan_controller.dart';

class GuardVisitorScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuardVisitorScanController>(
      () => GuardVisitorScanController(),
    );
  }
}
