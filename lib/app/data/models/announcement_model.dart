import 'package:jiran_app/app/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AnnouncementModel {
    final int? announcementId;
    final String? announcementSubject;
    final String? announcementDescription;
    final int? attachmentId;
    final int? createdById;
    final DateTime? createdDate;
    final int? systemId;
    final SystemModel? system;

    AnnouncementModel({
        this.announcementId,
        this.announcementSubject,
        this.announcementDescription,
        this.attachmentId,
        this.createdById,
        this.createdDate,
        this.systemId,
        this.system,
    });

    factory AnnouncementModel.fromJson(Map<String, dynamic> json) => _$AnnouncementModelFromJson(json);
    Map<String, dynamic> toJson() => _$AnnouncementModelToJson(this);
}
