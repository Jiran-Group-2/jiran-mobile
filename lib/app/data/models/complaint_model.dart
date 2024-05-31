import 'package:json_annotation/json_annotation.dart';

part 'complaint_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ComplaintModel {
    final int? complaintId;
    final int? userId;
    final DateTime? createdDate;
    final int? complaintCategoryId;
    final String? complaintLocation;
    final String? complaintSubject;
    final String? complaintDescription;
    final dynamic attachmentId;
    final dynamic feedbackId;
    final String? status;
    final int? systemId;
    final dynamic system;

    ComplaintModel({
        this.complaintId,
        this.userId,
        this.createdDate,
        this.complaintCategoryId,
        this.complaintLocation,
        this.complaintSubject,
        this.complaintDescription,
        this.attachmentId,
        this.feedbackId,
        this.status,
        this.systemId,
        this.system,
    });

    factory ComplaintModel.fromJson(Map<String, dynamic> json) => _$ComplaintModelFromJson(json);

    Map<String, dynamic> toJson() => _$ComplaintModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComplaintCategoryModel {
    final int? complaintCategoryId;
    final String? categoryName;
    final String? categoryDescription;
    final int? createdById;
    final DateTime? createdDate;

    ComplaintCategoryModel({
        this.complaintCategoryId,
        this.categoryName,
        this.categoryDescription,
        this.createdById,
        this.createdDate,
    });

    factory ComplaintCategoryModel.fromJson(Map<String, dynamic> json) => _$ComplaintCategoryModelFromJson(json);

    Map<String, dynamic> toJson() => _$ComplaintCategoryModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComplaintRequestModel {
  final int providedUserID;
  final int providedComplaintCategoryID;
  final String providedComplaintLocation;
  final String providedComplaintSubject;
  final String providedComplaintDescription;
  final int providedSystemID;

  ComplaintRequestModel({required this.providedUserID, required this.providedComplaintCategoryID, required this.providedComplaintLocation, required this.providedComplaintSubject, required this.providedComplaintDescription, required this.providedSystemID});

  factory ComplaintRequestModel.fromJson(Map<String, dynamic> json) => _$ComplaintRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComplaintRequestModelToJson(this);
}