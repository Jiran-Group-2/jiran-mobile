// import 'dart:async';
// import 'dart:convert';

// import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_masked_text2/flutter_masked_text2.dart';
// import 'package:get/get.dart';
// import 'package:jiran_app/app/data/models/bank_model.dart';
// import 'package:jiran_app/app/data/models/bill_model.dart';
// import 'package:jiran_app/app/data/models/fpx_model.dart';
// import 'package:jiran_app/app/data/providers/bill_providers.dart';
// import 'package:jiran_app/controller_export.dart';

// class PaySimAmountController extends GetxController {

//   String? newRoute;

//   FpxModel? fpxModel;
//   String? fpxMerchantApiKey;
//   String? fpxMerchantPublicKey;
//   String? fpxSecretKey;

//   Uri? url;
//   PayResult? payResult;
//   RxBool isLoading = false.obs;
//   // List<PaymentRequeryData>? paymentRequery = [];

//   Uri triggerUrl = Uri.parse(dotenv.env['triggerUrl']!);
//   Uri triggerUrlAffin = Uri.parse(dotenv.env['triggerUrlAffin']!);

//   double progress = 0;
//   int countdown = 5;
//   Timer? timer;
//   bool isCountdown = false;
//   bool isCanGoBack = true;
//   String? category;

//   @override
//   void onInit() async {
//     category = Get.arguments['category'];
//     if (category == 'Biller') {
//       fpxMerchantApiKey = dotenv.env['billFpxMerchantApiKey']!;
//       fpxMerchantPublicKey = dotenv.env['billerFpxMerchantPublicKey']!;
//       fpxSecretKey = dotenv.env['billFpxSecretKey']!;

//       appLogger(fpxMerchantPublicKey);
//     } else {
//       fpxMerchantApiKey = dotenv.env['fpxMerchantApiKey']!;
//       fpxMerchantPublicKey = dotenv.env['fpxMerchantPublicKey']!;
//       fpxSecretKey = dotenv.env['fpxSecretKey']!;
//     }

//     url = Uri.parse('${dotenv.env['UrlFpx']!}/$fpxMerchantPublicKey');
//     fpxModel = Get.arguments['fpxModel'];
//     // appLogger(fpxModel!.txnBuyerName);
//     newRoute = Get.arguments['newRoute'];
//     appLogger('category ::$category');

//     appLogger('start 1');
    

//     super.onInit();

//   }

//   String getSignature() {
//     String signature;

//     List<int> key = utf8.encode(fpxSecretKey!);
//     List<int> bytes = utf8.encode('$fpxMerchantApiKey|'
//         '${fpxModel!.txnAmount.toStringAsFixed(2)}|'
//         '${fpxModel!.txnBuyerEmail}|'
//         '${fpxModel!.txnBuyerName}|'
//         '${fpxModel!.txnBuyerPhone}|'
//         '${fpxModel!.txnOrderId}|'
//         '${fpxModel!.txnProductDesc}|'
//         '${fpxModel!.txnProductName}');

//     Hmac hmacSha256 = Hmac(sha256, key);
//     Digest digest = hmacSha256.convert(bytes);

//     signature = digest.toString();

//     return signature;
//   }

//   // mq() async {
//   //   appLogger("Setup mq");
//   //   var client = Client(
//   //     settings: ConnectionSettings(
//   //       host: "mq.berrypay.dev",
//   //       port: 25671,
//   //       authProvider: const PlainAuthenticator("arsyad", "arsyad"),
//   //       virtualHost: "bpg",
//   //       onBadCertificate: (p0) => true,
//   //       tlsContext: SecurityContext(withTrustedRoots: true),
//   //     ),
//   //   );

//   //   bool isReceived = false;
//   //   Channel channel = await client.channel();
//   //   Queue queue = await channel
//   //       .queue("REMITX.${fpxModel!.txnOrderId}"); //remitx.${transactionI}D
//   //   Consumer consumer = await queue.consume();

//   //   consumer.listen(
//   //     (event) {
//   //       appLogger('mq listeningggggg');
//   //       isReceived = true;
//   //       appLogger(event.payloadAsString);
//   //       if (isReceived) {
//   //         consumer.cancel();
//   //         Get.back();
//   //       }
//   //     },
//   //     // onDone: () => queue.delete(),
//   //   );
//   // }

//   getFpxTransaction() async {
//     appLogger('start getFpxTransaction');
//     isLoading(true);

//     var response = await remittanceRepo.getFpxTransaction(PaymentRequeryRequest(
//       BpgTxnId: fpxModel!.txnOrderId,
//     ));

//     if (verifyResponse(response)) {
//       isLoading(false);
//       appLogger('cannot get');
//       return;
//     }
//     isLoading(false);

//     response as PaymentRequeryResponse;

//     paymentRequery = response.data;
//     appLogger('paymentRequery ${jsonEncode(paymentRequery)}');
//     appLogger('category1:: $category');

//     Get.offAndToNamed(newRoute!, arguments: {
//       'amount': fpxModel!.txnAmount.toStringAsFixed(2),
//       'txnId': fpxModel!.txnOrderId,
//       'status': paymentRequery![0].paymentModeStatus,
//       'message': paymentRequery![0].paymentModeStatusMsg,
//       'description': paymentRequery![0].bizSysStatusMsg,
//       'statusRemit': paymentRequery![0].bizSysStatus,
//       'paymentMode': paymentRequery![0].paymentMode,
//       'category': category
//     });
//   }
// }
