
import 'package:json_annotation/json_annotation.dart';

part 'fpx_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FpxModel {
  /// Transaction Amount [txnAmount] will be formatted to
  /// 2 decimal points
  final double txnAmount;

  /// Transaction Buyer Email
  final String txnBuyerEmail;

  /// Transaction Buyer Name
  final String txnBuyerName;

  /// Transaction Buyer Phone
  final String txnBuyerPhone;

  /// Generate this via your back-end or you can create it
  /// from your front-end application
  final String txnOrderId;

  /// Transaction Product Description
  final String txnProductDesc;

  /// Transaction Product Name
  final String txnProductName;
  final String newRoute;

  FpxModel({
    required this.txnAmount,
    required this.txnBuyerEmail,
    required this.txnBuyerName,
    required this.txnBuyerPhone,
    required this.txnOrderId,
    required this.txnProductDesc,
    required this.txnProductName,
    required this.newRoute
  });

  factory FpxModel.fromJson(Map<String, dynamic> json) =>
      _$FpxModelFromJson(json);

  Map<String, dynamic> toJson() => _$FpxModelToJson(this);
}