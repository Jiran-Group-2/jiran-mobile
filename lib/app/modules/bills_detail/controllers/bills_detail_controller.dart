import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';

class BillsDetailController extends GetxController {
  late Rx<BillModel> bill;
  RxBool isPending = true.obs;

  @override
  void onInit() {
    super.onInit();
    bill = Get.arguments;

    if (bill.value.balance == 0.0) {
      isPending(false);
    }
  }
}
