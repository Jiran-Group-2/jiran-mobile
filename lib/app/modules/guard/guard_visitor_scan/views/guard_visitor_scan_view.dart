import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/guard_visitor_scan_controller.dart';

class GuardVisitorScanView extends GetView<GuardVisitorScanController> {
  const GuardVisitorScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuardVisitorScanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GuardVisitorScanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
