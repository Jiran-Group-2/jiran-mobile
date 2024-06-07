import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/guard_controller.dart';

class GuardView extends GetView<GuardController> {
  const GuardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GuardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
