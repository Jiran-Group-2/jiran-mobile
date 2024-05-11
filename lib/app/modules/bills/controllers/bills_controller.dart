import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BillsController extends GetxController with GetTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController  = TabController(length: 2, vsync: this);
  }
}
