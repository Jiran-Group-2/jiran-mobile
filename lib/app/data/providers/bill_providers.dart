import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/app_model.dart';
import 'package:jiran_app/app/data/models/bank_model.dart';
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

  payBills(PayBillRequest request) async {
    var response = await httpClient.post('/Bill/UpdateUnitBill?UnitBillID=${request.unitNumberId}&providedAmount=${request.providedAmount}&providedPaid=${request.providedPaid}&providedBalance=${request.providedBalance}');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      return true;
    } else {
      return AppError('Connection error!');
    }
  }

  getBanks() async {
    final String response = await rootBundle.loadString('assets/json/banks.json');
    final List<dynamic> data = json.decode(response)['banks'];
    return data.map((json) => BankModel.fromJson(json)).toList();
  }  
}