import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/user_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/app/data/providers/user_providers.dart';
import 'package:jiran_app/app/routes/app_pages.dart';
import 'package:jiran_app/controller_export.dart';

class LoginController extends GetxController {
  UserProvider userProvider = Get.find<UserProvider>();
  StorageProvider storageProvider = Get.find<StorageProvider>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isObscure = true.obs;

  @override
  onReady() async {
    await Future.delayed(const Duration(seconds: 1));
    appLogger(storageProvider.getUserId());
    //  ? Get.offAllNamed(Routes.HOME) : null;

    if (storageProvider.getRole() != null) {
      if (storageProvider.getRole() == 3) {
        Get.offAllNamed(Routes.HOME);
      } else if (storageProvider.getRole() == 4) {
        Get.offAllNamed(Routes.GUARD_HOME);
      }
    }
  }

  login(String? role) async {
    if (!isProd) {
      if (role == 'guard') {
        emailController.text = 'Guard1';
        passwordController.text = 'Guard1';
      } else if (role == 'user') {
        emailController.text = 'hadzim';
        passwordController.text = 'hadzim';
      }
    }
    
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      AppSnackbar.errorSnackbar('Please enter email and password');
      return;
    }

    EasyLoading.show();
    var response = await userProvider.login(emailController.text, passwordController.text);

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    List<UserModel> user = response;
    storageProvider.setRole(user[0].role?.roleId ?? 0);
    storageProvider.setEmail(user[0].email ?? '');
    storageProvider.setUserId(user[0].userId);
    storageProvider.setUserName(user[0].userLogin ?? '');
    storageProvider.setUser(user[0]);

    if (storageProvider.getRole() == 4) {
      Get.offAllNamed(Routes.GUARD_HOME);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
    
    EasyLoading.dismiss();
  }
}
