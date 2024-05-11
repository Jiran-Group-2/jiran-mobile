import 'package:get/get.dart';

import '../controllers/visitor_detail_controller.dart';

class VisitorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitorDetailController>(
      () => VisitorDetailController(),
    );
  }
}
