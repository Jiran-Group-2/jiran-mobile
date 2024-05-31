import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complaint_add_controller.dart';

class ComplaintAddView extends GetView<ComplaintAddController> {
  const ComplaintAddView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComplaintAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ComplaintAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
