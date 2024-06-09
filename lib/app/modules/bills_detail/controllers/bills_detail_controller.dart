import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';

class BillsDetailController extends GetxController {
  StorageProvider sp = Get.find<StorageProvider>();
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
