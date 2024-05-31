import 'package:json_annotation/json_annotation.dart';
part 'app_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppError {
  final String? message;

  AppError(this.message);

  factory AppError.fromJson(Map<String, dynamic> json) => _$AppErrorFromJson(json);
  Map<String, dynamic> toJson() => _$AppErrorToJson(this);
}