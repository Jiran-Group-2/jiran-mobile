import 'package:get/get.dart';

import '../controllers/bills_detail_controller.dart';

class BillsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillsDetailController>(
      () => BillsDetailController(),
    );
  }
}
