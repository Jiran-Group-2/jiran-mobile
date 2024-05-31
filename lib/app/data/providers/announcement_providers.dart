import 'dart:convert';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/announcement_model.dart';
import 'package:jiran_app/app/data/models/app_model.dart';
import 'package:jiran_app/app/data/models/user_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';

class AnnouncementProvider extends GetConnect {
  StorageProvider sp = Get.put(StorageProvider());

  @override
  void onInit() async {
    httpClient.baseUrl = apiUrl;
  }

  getAnnouncements() async {
    UserModel user = sp.getUser()!;
    
    var response = await httpClient.get('/Announcement/Get?systemID=${user.systemId}');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<AnnouncementModel> baseResponse = jsonData.map((json) => AnnouncementModel.fromJson(json)).toList();
      return baseResponse;
    } else {
      return AppError('Connection error!');
    }
  }

  
}