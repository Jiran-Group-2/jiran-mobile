import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bills_controller.dart';

class BillsView extends GetView<BillsController> {
  const BillsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BillsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BillsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
