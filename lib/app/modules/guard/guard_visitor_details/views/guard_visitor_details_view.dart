import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/guard_visitor_details_controller.dart';

class GuardVisitorDetailsView extends GetView<GuardVisitorDetailsController> {
  const GuardVisitorDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuardVisitorDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GuardVisitorDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
