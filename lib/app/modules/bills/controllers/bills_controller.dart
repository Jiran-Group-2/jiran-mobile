import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/data/providers/bill_providers.dart';
import 'package:jiran_app/controller_export.dart';

class BillsController extends GetxController with GetTickerProviderStateMixin {
  late final TabController tabController;
  BillProvider billProvider = Get.find<BillProvider>();
  RxList<BillModel> bills = <BillModel>[].obs;

  RxList<BillModel> paidBills = <BillModel>[].obs;
  RxList<BillModel> pendingBills = <BillModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController  = TabController(length: 2, vsync: this);
    getBills();
  }
  
  getBills() async {
    EasyLoading.show();
    var response = await billProvider.getBills();

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    bills.value = response;
    paidBills.clear();
    pendingBills.clear();
    for (var bill in bills) {
      bill.isPending?.value = bill.balance != 0 ? true : false;

      if (bill.isPending!.value) {
        pendingBills.add(bill);
      } else {
        paidBills.add(bill);
      }
    }

    appLogger(pendingBills.length);
    appLogger(paidBills.length);

    EasyLoading.dismiss();
  }
}
