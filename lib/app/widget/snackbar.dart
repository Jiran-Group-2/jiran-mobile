import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';

class AppSnackbar {
  static void errorSnackbar(String message, {String? title, Color? backgroundColor}) {
    Get.snackbar(
      title ?? 'Oops!', 
      message, 
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      backgroundColor: backgroundColor ?? AppColors.white,
    );
  }

  static void successSnackbar(String message, {String? title, Color? backgroundColor}) {
    Get.snackbar(
      title ?? 'Success!', 
      message, 
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      backgroundColor: backgroundColor ?? AppColors.white,
    );
  }
}