import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/variables.dart';

import '../controllers/payment_gateway_controller.dart';

class PaymentGatewayView extends GetView<PaymentGatewayController> {
  const PaymentGatewayView({super.key});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.isCanGoBack.value,
      child: Scaffold(
        appBar: AppBar(title: const Text('FPX'), elevation: 0, automaticallyImplyLeading: controller.isCanGoBack.value),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // Obx(() => Text(controller.currentUrl.toString())),
              Obx(() => controller.currentProgress.value != 1.0 ? LinearProgressIndicator(value: controller.currentProgress.value) : const SizedBox.shrink()),
              Obx(() => Visibility(
                visible: controller.isCountdown.value,
                child: Text('This page will be closed in ${controller.countdown} ${controller.countdown.value < 2 ? 'second' : 'seconds'}')
              )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: InAppWebView(
                    onWebViewCreated: (webController) {
                      webController.addWebMessageListener(WebMessageListener(
                        jsObjectName: ''
                      ));
                    },
                    initialUrlRequest: URLRequest(
                      url: WebUri(controller.currentUrl.value.toString()),
                      method: 'POST',
                      body: Uint8List.fromList(
                        utf8.encode(
                          'api_key=$fpxMerchantApiKey&'
                          'txn_amount=${controller.fpxModel.value.txnAmount.toStringAsFixed(2)}&'
                          'txn_buyer_email=${controller.fpxModel.value.txnBuyerEmail}&'
                          'txn_buyer_name=${controller.fpxModel.value.txnBuyerName}&'
                          'txn_buyer_phone=${controller.fpxModel.value.txnBuyerPhone}&'
                          'txn_order_id=${controller.fpxModel.value.txnOrderId}&'
                          'txn_product_desc=${controller.fpxModel.value.txnProductDesc}&'
                          'txn_product_name=${controller.fpxModel.value.txnProductName}&'
                          'signature=${controller.getSignature()}'
                        )
                      ),
                      headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                      }
                    ),
                    onLoadStart: (webController, url ) => controller.onLoadStart(webController, url),
                    onLoadStop: (webController, url) => controller.onLoadStop(webController, url),
                    onProgressChanged: (webController, url) => controller.onProgressChanged(webController, url),
                    // javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
