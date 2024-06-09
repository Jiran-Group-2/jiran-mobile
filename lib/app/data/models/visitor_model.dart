import 'package:json_annotation/json_annotation.dart';
part 'visitor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VisitorModel {
    final int? visitorId;
    final String? visitorName;
    final String? visitorMobileNo;
    final dynamic visitorNric;
    final int? visitorQuantity;
    final String? visitorPurposeOfVisit;
    final int? visitorVehicleType;
    final String? visitorVehicle;
    final String? visitorVehiclePlate;
    final String? approvalStatus;
    final int? unitNumberId;
    final int? createdById;
    final DateTime? createdDate;
    final dynamic qrFileName;
    final dynamic qrExpiryDate;

    VisitorModel({
        this.visitorId,
        this.visitorName,
        this.visitorMobileNo,
        this.visitorNric,
        this.visitorQuantity,
        this.visitorPurposeOfVisit,
        this.visitorVehicleType,
        this.visitorVehicle,
        this.visitorVehiclePlate,
        this.approvalStatus,
        this.unitNumberId,
        this.createdById,
        this.createdDate,
        this.qrFileName,
        this.qrExpiryDate,
    });

    factory VisitorModel.fromJson(Map<String, dynamic> json) => _$VisitorModelFromJson(json);
    Map<String, dynamic> toJson() => _$VisitorModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VisitorRequestModel {
    final String? providedVisitorName;
    final String? providedVisitorMobileNo;
    final String? providedVisitorNRIC;
    final int? providedQuantity;
    final String? providedPurposeOfVisit;
    final int? providedVehicleType;
    final String? providedPlateNo;
    final int? providedUnitNumberID;
    final int? providedCreatedByID;

    VisitorRequestModel({
        this.providedVisitorName,
        this.providedVisitorMobileNo,
        this.providedVisitorNRIC,
        this.providedQuantity,
        this.providedPurposeOfVisit,
        this.providedVehicleType,
        this.providedPlateNo,
        this.providedUnitNumberID,
        this.providedCreatedByID,
    });

    factory VisitorRequestModel.fromJson(Map<String, dynamic> json) => _$VisitorRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$VisitorRequestModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VisitorUpdateModel {
    final int? providedVisitorID;
    final String? providedVisitorName;
    final String? providedVisitorMobileNo;
    final String? providedVisitorNRIC;
    final int? providedQuantity;
    final String? providedPurposeOfVisit;
    final int? providedVehicleType;
    final String? providedPlateNo;
    final int? providedUnitNumberID;
    final int? providedCreatedByID;
    final String? providedStatus;
    
    VisitorUpdateModel({
      this.providedVisitorID,
      this.providedVisitorName,
      this.providedVisitorMobileNo,
      this.providedVisitorNRIC,
      this.providedQuantity,
      this.providedPurposeOfVisit,
      this.providedVehicleType,
      this.providedPlateNo,
      this.providedUnitNumberID,
      this.providedCreatedByID,
      this.providedStatus
    });

    factory VisitorUpdateModel.fromJson(Map<String, dynamic> json) => _$VisitorUpdateModelFromJson(json);
    Map<String, dynamic> toJson() => _$VisitorUpdateModelToJson(this);
}