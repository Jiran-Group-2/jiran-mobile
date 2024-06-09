import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/data/models/fpx_model.dart';
import 'package:jiran_app/app/data/providers/bill_providers.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/controller_export.dart';

class PaymentGatewayController extends GetxController {

  late Rx<FpxModel> fpxModel;
  BillProvider billProvider = Get.find<BillProvider>();
  StorageProvider sp = Get.find<StorageProvider>();

  RxBool isCountdown = false.obs;
  RxBool isCanGoBack = false.obs;
  RxInt countdown = 5.obs;
  RxDouble currentProgress = 0.00.obs;
  Rx<Uri> currentUrl = Uri.parse('').obs;
  Timer? timer;

  @override
  void onInit() {
    fpxModel = Get.arguments;
    currentUrl.value = Uri.parse(fpxApiUrl);
    super.onInit();
  }

  getSignature() {
    String signature;
    
    List<int> key = utf8.encode(fpxSecretKey);
    List<int> bytes = utf8.encode(
      '$fpxMerchantApiKey|'
      '${fpxModel.value.txnAmount.toStringAsFixed(2)}|'
      '${fpxModel.value.txnBuyerEmail}|'
      '${fpxModel.value.txnBuyerName}|'
      '${fpxModel.value.txnBuyerPhone}|'
      '${fpxModel.value.txnOrderId}|'
      '${fpxModel.value.txnProductDesc}|'
      '${fpxModel.value.txnProductName}'
    );

    Hmac hmacSha256 = Hmac(sha256, key);
    Digest digest = hmacSha256.convert(bytes);

    signature = digest.toString();

    return signature;
  }

  onLoadStop(InAppWebViewController controller, WebUri? url) async {
    appLogger('onLoadStop');
    if (url == WebUri(fpxResponseApiUrl)) {
      isCountdown(true);

      timer = Timer.periodic(const Duration(seconds: 1), (_) async {
        appLogger('countdown:: $countdown');
        if (countdown.value > -1) {
          countdown.value--;
        }
        if (countdown.value == 0) {
          EasyLoading.show();

          controller.getHtml().then((value) {
            if (value!.contains('Not Successful')) {
              Get.offAllNamed(fpxModel.value.newRoute);
              EasyLoading.dismiss();
              AppSnackbar.errorSnackbar('Payment failed');
              return;
            }
          });

          PayBillRequest payBillRequest = PayBillRequest(
            unitNumberId: sp.getUser()!.unitNumberId!,
            providedPaid: fpxModel.value.txnAmount,
          );

          var response = await billProvider.payBills(payBillRequest);

          if (!verifyResponse(response)) {
            AppError appError = response;
            AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
          } else {
            AppSnackbar.successSnackbar('Payment success!');
          }

          EasyLoading.dismiss();
          Get.offAllNamed(fpxModel.value.newRoute);
        }
        appLogger('$countdown');
      });

    }
  }

  onLoadStart(InAppWebViewController controller, WebUri? url) {
    currentUrl.value = url!;
    if (currentUrl.value != Uri.parse(fpxApiUrl)) {
      isCanGoBack(false);
    }
  }

  onProgressChanged(InAppWebViewController controller, int progress) {
    currentProgress(progress / 100);
    appLogger(currentProgress);
  }
}
