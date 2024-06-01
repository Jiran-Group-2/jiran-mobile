import 'package:get/get.dart';

import '../controllers/pay_sim_amount_controller.dart';

class PaySimAmountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaySimAmountController>(
      () => PaySimAmountController(),
    );
  }
}
