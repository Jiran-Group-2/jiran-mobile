import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/complaint_providers.dart';

import '../controllers/complaint_controller.dart';

class ComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintController>(
      () => ComplaintController(),
    );
    Get.lazyPut(() => ComplaintProvider());
  }
}
