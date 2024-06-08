// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:get/get.dart';
// import 'package:jiran_app/app/core/logger.dart';
// import 'package:jiran_app/app/core/theme.dart';
// import '../controllers/pay_sim_amount_controller.dart';

// class PaySimAmountView extends GetView<PaySimAmountController> {
//   const PaySimAmountView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // if (controller.isCanGoBack) {
//         //   controller.getFpxTransaction();
//         //   // appLogger('masuk');
//         //   // Get.offAndToNamed(controller.newRoute!, arguments: {
//         //   //   'status': 'Failed',
//         //   //   'amount': controller.fpxModel!.txnAmount.toStringAsFixed(2),
//         //   //   'txnId': controller.fpxModel!.txnOrderId,
//         //   //   'message': 'Payment Failed '
//         //   // });
//         // }
//         return false;
//         // return controller.isCanGoBack;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: AppColors.primary,
//           iconTheme: const IconThemeData(color: Colors.black),
//           automaticallyImplyLeading: false,
//           title: const Text(
//             'FPX',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
//           ),
//         ),
//         body: Body(
//           controller: controller,
//         ),
//       ),
//     );
//   }
// }

// class Body extends StatefulWidget {
//   const Body({
//     super.key,
//     required this.controller,
//   });

//   final PaySimAmountController controller;

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Text(url.toString()),
//         widget.controller.progress != 1.0
//             ? LinearProgressIndicator(value: widget.controller.progress)
//             : Container(),
//         Visibility(
//             visible: widget.controller.isCountdown,
//             child: Text(
//                 'This page will be closed in ${widget.controller.countdown} ${widget.controller.countdown < 2 ? 'second' : 'seconds'}')),
//         Expanded(
//           child: InAppWebView(
//             onWebViewCreated: (controller) async {
//               controller
//                   .addWebMessageListener(WebMessageListener(jsObjectName: ''));
//             },
//             initialUrlRequest: URLRequest(
//                 url: widget.controller.url,
//                 method: 'POST',
//                 body: Uint8List.fromList(utf8.encode(
//                     'api_key=${widget.controller.fpxMerchantApiKey}&'
//                     'txn_amount=${widget.controller.fpxModel!.txnAmount.toStringAsFixed(2)}&'
//                     'txn_buyer_email=${widget.controller.fpxModel!.txnBuyerEmail}&'
//                     'txn_buyer_name=${widget.controller.fpxModel!.txnBuyerName}&'
//                     'txn_buyer_phone=${widget.controller.fpxModel!.txnBuyerPhone}&'
//                     'txn_order_id=${widget.controller.fpxModel!.txnOrderId}&'
//                     'txn_product_desc=${widget.controller.fpxModel!.txnProductDesc}&'
//                     'txn_product_name=${widget.controller.fpxModel!.txnProductName}&'
//                     'signature=${widget.controller.getSignature()}')),
//                 headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
//             onLoadStart: (InAppWebViewController controller, url) {
//               setState(() {
//                 widget.controller.url = url!;
//               });
//               if (widget.controller.url != widget.controller.url) {
//                 if (!mounted) return;
//                 setState(() => widget.controller.isCanGoBack = false);
//               }
//               // appLogger('onLoadStart');
//             },
//             onLoadStop: (InAppWebViewController controller, url) async {
//               setState(() {
//                 widget.controller.url = url!;
//                 appLogger('url:: $url');
//               });

//               // appLogger('onLoadStop');

//               if (widget.controller.url ==
//                   Uri.parse(
//                       'https://gate.berrypay.xyz/bpg-my/v1/transaction/fpx-callback')) {
//                 appLogger('here 1');
//                 widget.controller.getFpxTransaction();
//               } else if (widget.controller.url ==
//                   widget.controller.triggerUrl) {
//                 appLogger('here 2');
//                 appLogger('called ${widget.controller.triggerUrl}');
//                 setState(() {
//                   widget.controller.isCountdown = true;
//                 });
//                 widget.controller.timer =
//                     Timer.periodic(const Duration(seconds: 1), (_) {
//                   if (widget.controller.countdown > -1) {
//                     if (!mounted) return;
//                     appLogger('here 3');
//                     setState(() => widget.controller.countdown--);
//                   }
//                   if (widget.controller.countdown == 0) {
//                     // Callback
//                     appLogger('here 4');
//                     widget.controller.getFpxTransaction();
//                   }
//                   // appLogger('${widget.controller.countdown}');
//                 });

//                 // appLogger('end ${widget.controller.triggerUrl}');
//               } else if (widget.controller.url ==
//                   widget.controller.triggerUrlAffin) {
//                 appLogger('here 6');
//                 appLogger('called ${widget.controller.triggerUrl}');
//                 setState(() {
//                   widget.controller.isCountdown = true;
//                 });
//                 widget.controller.timer =
//                     Timer.periodic(const Duration(seconds: 1), (_) {
//                   if (widget.controller.countdown > -1) {
//                     if (!mounted) return;
//                     appLogger('here 7');
//                     setState(() => widget.controller.countdown--);
//                   }
//                   if (widget.controller.countdown == 0) {
//                     // Callback
//                     appLogger('here 8');
//                     widget.controller.getFpxTransaction();
//                   }
//                   // appLogger('${widget.controller.countdown}');
//                 });

//                 // appLogger('end ${widget.controller.triggerUrl}');
//               }
//             },
//             onProgressChanged:
//                 (InAppWebViewController controller, int progress) {
//               setState(() {
//                 widget.controller.progress = progress / 100;
//                 appLogger(widget.controller.progress);
//               });
//             },
//             // javascriptMode: JavascriptMode.unrestricted,
//           ),
//         ),
//       ],
//     );
//   }
// }
