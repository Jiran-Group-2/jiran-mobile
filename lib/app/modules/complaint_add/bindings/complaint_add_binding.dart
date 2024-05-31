import 'package:get/get.dart';

import '../controllers/complaint_add_controller.dart';

class ComplaintAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintAddController>(
      () => ComplaintAddController(),
    );
  }
}
