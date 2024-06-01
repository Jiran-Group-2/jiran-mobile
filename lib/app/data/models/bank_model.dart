import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable()
class BankModel {
  final int id;
  final String name;
  final String code;

  BankModel({
    required this.id,
    required this.name,
    required this.code,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);
  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}