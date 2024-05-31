import 'dart:convert';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/app_model.dart';
import 'package:jiran_app/app/data/models/complaint_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';

class ComplaintProvider extends GetConnect {
  StorageProvider sp = Get.put(StorageProvider());
  Map<String, String> defaultHeader = {};

  @override
  void onInit() async {
    httpClient.baseUrl = apiUrl;
    String? token = Get.find<StorageProvider>().getToken();
    if (token != null) {
      defaultHeader['Authorization'] = 'Bearer $token';
    }
  }

  getComplaints(int? systemId, int? userId) async {
    appLogger('$systemId, $userId');
    
    var response = await httpClient.get('/Complaint/GetComplaint?systemID=$systemId&userID=$userId');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<ComplaintModel> baseResponse = jsonData.map((json) => ComplaintModel.fromJson(json)).toList();
      return baseResponse;
    } else {
      return AppError('Connection error!');
    }
  }

  getComplaintCategory() async {
    var response = await httpClient.get('/Complaint/GetComplaintCategory');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<ComplaintCategoryModel> baseResponse = jsonData.map((json) => ComplaintCategoryModel.fromJson(json)).toList();
      return baseResponse;
    } else {
      return AppError('Connection error!');
    }
  }
  
}