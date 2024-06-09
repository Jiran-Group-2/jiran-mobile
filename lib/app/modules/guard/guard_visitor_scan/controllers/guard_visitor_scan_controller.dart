import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/data/models/visitor_model.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class GuardVisitorScanController extends FullLifeCycleController with FullLifeCycleMixin {
  RxList<VisitorModel> visitors = <VisitorModel>[].obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Rxn<Barcode> barcode = Rxn<Barcode>();

  final MobileScannerController msController = MobileScannerController(
  // required options for the scanner
  );

  StreamSubscription<Object?>? subscription;

  @override
  void onInit() {
    super.onInit();
    visitors.value = Get.arguments;

    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    subscription = msController.barcodes.listen(handleBarcode);

    // Finally, start the scanner itself.
    unawaited(msController.start());
  }

  @override
  void onReady() {
    super.onReady();
    appLogger('ready');
  }

  @override
  void onClose() async {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
    unawaited(subscription?.cancel());
    subscription = null;
    await msController.dispose();
  }
  
  @override
  void onDetached() {
    appLogger('detached');
  }
  
  @override
  void onHidden() {
    appLogger('hidden');
  }
  
  @override
  void onInactive() {
    appLogger('inactive');
  }
  
  @override
  void onPaused() {
    appLogger('paused');
  }
  
  @override
  void onResumed() {
    appLogger('resumed');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (!msController.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        subscription = msController.barcodes.listen(handleBarcode);
        unawaited(msController.start());
      case AppLifecycleState.inactive:
        unawaited(subscription?.cancel());
        subscription = null;
        unawaited(msController.stop());
    }
  }

  void handleBarcode(BarcodeCapture barcodes) {
    barcode.value = barcodes.barcodes.firstOrNull;

    if (barcode.value == null) {
      return;
    }

    if (barcode.value != null) {

      // Find the visitorId in the list of visitors
      String visitorId = barcode.value!.rawValue!;
      VisitorModel? visitor = visitors.firstWhereOrNull((element) => element.visitorId == int.parse(visitorId));

      if (visitor == null) {
        Get.snackbar('Error', 'Visitor not found');
        return;
      }

      Get.offAndToNamed(Routes.GUARD_VISITOR_DETAILS, arguments: visitor.obs);
    }
  }
}
