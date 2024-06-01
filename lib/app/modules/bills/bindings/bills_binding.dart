import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/bill_providers.dart';

import '../controllers/bills_controller.dart';

class BillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillsController>(
      () => BillsController(),
    );
    Get.lazyPut(() => BillProvider());
  }
}
