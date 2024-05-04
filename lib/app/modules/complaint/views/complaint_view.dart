import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  const ComplaintView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComplaintView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ComplaintView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
