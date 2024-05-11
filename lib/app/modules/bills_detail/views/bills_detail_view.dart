import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bills_detail_controller.dart';

class BillsDetailView extends GetView<BillsDetailController> {
  const BillsDetailView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BillsDetailView'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(

      )
    );
  }
}
