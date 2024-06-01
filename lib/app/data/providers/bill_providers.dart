import 'dart:convert';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/app_model.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/data/models/user_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';

class BillProvider extends GetConnect {
  StorageProvider sp = Get.put(StorageProvider());

  @override
  void onInit() async {
    httpClient.baseUrl = apiUrl;
  }

  getBills() async {
    UserModel user = sp.getUser()!;
    
    var response = await httpClient.get('/Bill/GetUnitBill?UnitNumberID=${user.unitNumberId}');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<BillModel> baseResponse = jsonData.map((json) => BillModel.fromJson(json)).toList();
      return baseResponse;
    } else {
      return AppError('Connection error!');
    }
  }

  
}