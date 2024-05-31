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
