import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/visitor_providers.dart';

import '../controllers/visitor_controller.dart';

class VisitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitorController>(
      () => VisitorController(),
    );
    Get.lazyPut(() => VisitorProvider());
  }
}
