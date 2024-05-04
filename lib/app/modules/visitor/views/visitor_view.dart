import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/visitor_controller.dart';

class VisitorView extends GetView<VisitorController> {
  const VisitorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisitorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VisitorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
