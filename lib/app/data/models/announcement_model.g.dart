// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) =>
    AnnouncementModel(
      announcementId: (json['announcementId'] as num?)?.toInt(),
      announcementSubject: json['announcementSubject'] as String?,
      announcementDescription: json['announcementDescription'] as String?,
      attachmentId: (json['attachmentId'] as num?)?.toInt(),
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      systemId: (json['systemId'] as num?)?.toInt(),
      system: json['system'] == null
          ? null
          : SystemModel.fromJson(json['system'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
    <String, dynamic>{
      'announcementId': instance.announcementId,
      'announcementSubject': instance.announcementSubject,
      'announcementDescription': instance.announcementDescription,
      'attachmentId': instance.attachmentId,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'systemId': instance.systemId,
      'system': instance.system?.toJson(),
    };
