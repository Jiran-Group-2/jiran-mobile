import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/guard_visitor_scan_controller.dart';

class GuardVisitorScanView extends GetView<GuardVisitorScanController> {
  const GuardVisitorScanView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Visitor'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: controller.msController,
              onDetect: (barcodes) => controller.handleBarcode(barcodes),
            )
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => Center(
                child: (controller.barcode.value != null)
                    ? Text( 'Barcode Type: ${controller.barcode.value!.format} Data: ${controller.barcode.value!.rawValue}')
                    : const Text('Scan a code'),
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}
