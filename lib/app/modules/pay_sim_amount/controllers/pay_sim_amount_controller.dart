import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/bank_model.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/data/providers/bill_providers.dart';
import 'package:jiran_app/controller_export.dart';

class PaySimAmountController extends GetxController {

  BillProvider billProvider = Get.find<BillProvider>();
  RxList<BankModel> banks = <BankModel>[].obs;
  Rxn<BankModel> selectedBank = Rxn<BankModel>();

  final formKey = GlobalKey<FormState>();

  MoneyMaskedTextController makePaymentController = MoneyMaskedTextController(
    initialValue: 0.0,
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  Rx<BillModel> bill = BillModel().obs;

  @override
  void onInit() {
    super.onInit();
    bill = Get.arguments;
    getBanks();
  }

  getBanks() async {
    EasyLoading.show();
    banks.value = await billProvider.getBanks();
    selectedBank.value = banks.first;
    EasyLoading.dismiss();
  }

  payBill() async {
    if (!formKey.currentState!.validate()) {
      AppSnackbar.errorSnackbar('Please complete the form');
      return;
    }

    EasyLoading.show();
    PayBillRequest request = PayBillRequest(
      unitNumberId: bill.value.userBillId!,
      providedAmount: bill.value.amount!,
      providedPaid: double.parse(makePaymentController.text) + bill.value.paid!,
      providedBalance: bill.value.amount! - double.parse(makePaymentController.text),
    );
    var response = await billProvider.payBills(request);

     if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    Get.back(result: true);
    AppSnackbar.successSnackbar('Payment successful');
    EasyLoading.dismiss();
  }
}
