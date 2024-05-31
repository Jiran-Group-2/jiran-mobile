import 'package:get/get.dart';

import '../controllers/visitor_add_controller.dart';

class VisitorAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitorAddController>(
      () => VisitorAddController(),
    );
  }
}
