import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/visitor_providers.dart';

import '../controllers/guard_visitor_controller.dart';

class GuardVisitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuardVisitorController>(
      () => GuardVisitorController(),
    );
    Get.lazyPut(() => VisitorProvider());
  }
}
