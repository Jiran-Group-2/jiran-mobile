import 'dart:convert';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/logger.dart';
import 'package:jiran_app/app/core/variables.dart';
import 'package:jiran_app/app/data/models/app_model.dart';
import 'package:jiran_app/app/data/models/visitor_model.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';

class VisitorProvider extends GetConnect {
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

  getVisitors() async {
    var response = await httpClient.get('/User/GetVisitor');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<VisitorModel> baseResponse = jsonData.map((json) => VisitorModel.fromJson(json)).toList();
      return baseResponse;
    } else if (response.statusCode == 400) {
      return AppError(response.bodyString ?? '[${response.statusCode}] Connection error!');
    } else {
      return AppError('Connection error!');
    }
  }

  getVisitorById(int id) async {
    var response = await httpClient.get('/User/GetVisitor?unitUserID=$id');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<VisitorModel> baseResponse = jsonData.map((json) => VisitorModel.fromJson(json)).toList();
      return baseResponse;
    } else if (response.statusCode == 400) {
      return AppError(response.bodyString ?? '[${response.statusCode}] Connection error!');
    } else {
      return AppError('Connection error!');
    }
  }


  registerVisitor(VisitorRequestModel visitor) async {
    var response = await httpClient.post('/User/RegisterVisitor?providedVisitorName=${visitor.providedVisitorName}&providedVisitorMobileNo=${visitor.providedVisitorMobileNo}&providedVisitorNRIC=${visitor.providedVisitorNRIC}&providedQuantity=${visitor.providedQuantity}&providedPurposeOfVisit=${visitor.providedPurposeOfVisit}&providedVehicleType=${visitor.providedVehicleType}&providedPlateNo=${visitor.providedPlateNo}&providedUnitNumberID=${visitor.providedUnitNumberID}&providedCreatedByID=${visitor.providedCreatedByID}');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      List<dynamic> jsonData = jsonDecode(response.bodyString!);
      List<VisitorModel> baseResponse = jsonData.map((json) => VisitorModel.fromJson(json)).toList();
      return baseResponse;
    } else {
      return AppError('Connection error!');
    }
  }

  updateVisitor(VisitorUpdateModel visitor) async {
    var response = await httpClient.post('/User/UpdateVisitor?providedVisitorID=${visitor.providedVisitorID}&providedVisitorName=${visitor.providedVisitorName}&providedVisitorMobileNo=${visitor.providedVisitorMobileNo}&providedVisitorNRIC=${visitor.providedVisitorNRIC}&providedQuantity=${visitor.providedQuantity}&providedPurposeOfVisit=${visitor.providedPurposeOfVisit}&providedVehicleType=${visitor.providedVehicleType}&providedPlateNo=${visitor.providedPlateNo}&providedUnitNumberID=${visitor.providedUnitNumberID}&providedCreatedByID=${visitor.providedCreatedByID}&providedStatus=${visitor.providedStatus}');
    appLogger(response.request!.url);
    appLogger(response.status.code);

    if (response.status.isOk) {
      appLogger(response.bodyString);
      return true;
    } else {
      return AppError('Connection error!');
    }
  }
}