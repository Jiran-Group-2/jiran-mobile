// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintModel _$ComplaintModelFromJson(Map<String, dynamic> json) =>
    ComplaintModel(
      complaintId: (json['complaintId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      complaintCategoryId: (json['complaintCategoryId'] as num?)?.toInt(),
      complaintLocation: json['complaintLocation'] as String?,
      complaintSubject: json['complaintSubject'] as String?,
      complaintDescription: json['complaintDescription'] as String?,
      attachmentId: json['attachmentId'],
      feedbackId: json['feedbackId'],
      status: json['status'] as String?,
      systemId: (json['systemId'] as num?)?.toInt(),
      system: json['system'],
    );

Map<String, dynamic> _$ComplaintModelToJson(ComplaintModel instance) =>
    <String, dynamic>{
      'complaintId': instance.complaintId,
      'userId': instance.userId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'complaintCategoryId': instance.complaintCategoryId,
      'complaintLocation': instance.complaintLocation,
      'complaintSubject': instance.complaintSubject,
      'complaintDescription': instance.complaintDescription,
      'attachmentId': instance.attachmentId,
      'feedbackId': instance.feedbackId,
      'status': instance.status,
      'systemId': instance.systemId,
      'system': instance.system,
    };

ComplaintCategoryModel _$ComplaintCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ComplaintCategoryModel(
      complaintCategoryId: (json['complaintCategoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      categoryDescription: json['categoryDescription'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$ComplaintCategoryModelToJson(
        ComplaintCategoryModel instance) =>
    <String, dynamic>{
      'complaintCategoryId': instance.complaintCategoryId,
      'categoryName': instance.categoryName,
      'categoryDescription': instance.categoryDescription,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
    };

ComplaintRequestModel _$ComplaintRequestModelFromJson(
        Map<String, dynamic> json) =>
    ComplaintRequestModel(
      providedUserID: (json['providedUserID'] as num).toInt(),
      providedComplaintCategoryID:
          (json['providedComplaintCategoryID'] as num).toInt(),
      providedComplaintLocation: json['providedComplaintLocation'] as String,
      providedComplaintSubject: json['providedComplaintSubject'] as String,
      providedComplaintDescription:
          json['providedComplaintDescription'] as String,
      providedSystemID: (json['providedSystemID'] as num).toInt(),
    );

Map<String, dynamic> _$ComplaintRequestModelToJson(
        ComplaintRequestModel instance) =>
    <String, dynamic>{
      'providedUserID': instance.providedUserID,
      'providedComplaintCategoryID': instance.providedComplaintCategoryID,
      'providedComplaintLocation': instance.providedComplaintLocation,
      'providedComplaintSubject': instance.providedComplaintSubject,
      'providedComplaintDescription': instance.providedComplaintDescription,
      'providedSystemID': instance.providedSystemID,
    };
