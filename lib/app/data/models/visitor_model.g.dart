// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorModel _$VisitorModelFromJson(Map<String, dynamic> json) => VisitorModel(
      visitorId: (json['visitorId'] as num?)?.toInt(),
      visitorName: json['visitorName'] as String?,
      visitorMobileNo: json['visitorMobileNo'] as String?,
      visitorNric: json['visitorNric'],
      visitorQuantity: (json['visitorQuantity'] as num?)?.toInt(),
      visitorPurposeOfVisit: json['visitorPurposeOfVisit'] as String?,
      visitorVehicleType: (json['visitorVehicleType'] as num?)?.toInt(),
      visitorVehicle: json['visitorVehicle'] as String?,
      visitorVehiclePlate: json['visitorVehiclePlate'] as String?,
      approvalStatus: json['approvalStatus'] as String?,
      unitNumberId: (json['unitNumberId'] as num?)?.toInt(),
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      qrFileName: json['qrFileName'],
      qrExpiryDate: json['qrExpiryDate'],
    );

Map<String, dynamic> _$VisitorModelToJson(VisitorModel instance) =>
    <String, dynamic>{
      'visitorId': instance.visitorId,
      'visitorName': instance.visitorName,
      'visitorMobileNo': instance.visitorMobileNo,
      'visitorNric': instance.visitorNric,
      'visitorQuantity': instance.visitorQuantity,
      'visitorPurposeOfVisit': instance.visitorPurposeOfVisit,
      'visitorVehicleType': instance.visitorVehicleType,
      'visitorVehicle': instance.visitorVehicle,
      'visitorVehiclePlate': instance.visitorVehiclePlate,
      'approvalStatus': instance.approvalStatus,
      'unitNumberId': instance.unitNumberId,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'qrFileName': instance.qrFileName,
      'qrExpiryDate': instance.qrExpiryDate,
    };

VisitorRequestModel _$VisitorRequestModelFromJson(Map<String, dynamic> json) =>
    VisitorRequestModel(
      providedVisitorName: json['providedVisitorName'] as String?,
      providedVisitorMobileNo: json['providedVisitorMobileNo'] as String?,
      providedVisitorNRIC: json['providedVisitorNRIC'] as String?,
      providedQuantity: (json['providedQuantity'] as num?)?.toInt(),
      providedPurposeOfVisit: json['providedPurposeOfVisit'] as String?,
      providedVehicleType: (json['providedVehicleType'] as num?)?.toInt(),
      providedPlateNo: json['providedPlateNo'] as String?,
      providedUnitNumberID: (json['providedUnitNumberID'] as num?)?.toInt(),
      providedCreatedByID: (json['providedCreatedByID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VisitorRequestModelToJson(
        VisitorRequestModel instance) =>
    <String, dynamic>{
      'providedVisitorName': instance.providedVisitorName,
      'providedVisitorMobileNo': instance.providedVisitorMobileNo,
      'providedVisitorNRIC': instance.providedVisitorNRIC,
      'providedQuantity': instance.providedQuantity,
      'providedPurposeOfVisit': instance.providedPurposeOfVisit,
      'providedVehicleType': instance.providedVehicleType,
      'providedPlateNo': instance.providedPlateNo,
      'providedUnitNumberID': instance.providedUnitNumberID,
      'providedCreatedByID': instance.providedCreatedByID,
    };
