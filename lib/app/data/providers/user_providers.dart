import 'dart:convert';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/app_model.dart';
import 'package:jiran_app/app/data/models/user_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';

class UserProvider extends GetConnect {
  StorageProvider sp = Get.put(StorageProvider());
  Map<String, String> defaultHeader = {};

  @override
  void onInit() async {
    httpClient.baseUrl = apiUrl;
  }

  login(String username, String password) async {
    appLogger('$username, $password');
    
    var response = await httpClient.get('/User/login?username=$username&password=$password');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<UserModel> baseResponse = jsonData.map((json) => UserModel.fromJson(json)).toList();
      return baseResponse;
    } else if (response.status.isNotFound) {
      return AppError('Wrong username/password!');
    } else {
      return AppError('Connection error!');
    }
  }
  
}