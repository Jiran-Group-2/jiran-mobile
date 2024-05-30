import 'package:json_annotation/json_annotation.dart';

part 'complaint_model.g.dart';

@JsonSerializable()
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
