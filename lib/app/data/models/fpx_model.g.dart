// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fpx_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FpxModel _$FpxModelFromJson(Map<String, dynamic> json) => FpxModel(
      txnAmount: (json['txnAmount'] as num).toDouble(),
      txnBuyerEmail: json['txnBuyerEmail'] as String,
      txnBuyerName: json['txnBuyerName'] as String,
      txnBuyerPhone: json['txnBuyerPhone'] as String,
      txnOrderId: json['txnOrderId'] as String,
      txnProductDesc: json['txnProductDesc'] as String,
      txnProductName: json['txnProductName'] as String,
      newRoute: json['newRoute'] as String,
    );

Map<String, dynamic> _$FpxModelToJson(FpxModel instance) => <String, dynamic>{
      'txnAmount': instance.txnAmount,
      'txnBuyerEmail': instance.txnBuyerEmail,
      'txnBuyerName': instance.txnBuyerName,
      'txnBuyerPhone': instance.txnBuyerPhone,
      'txnOrderId': instance.txnOrderId,
      'txnProductDesc': instance.txnProductDesc,
      'txnProductName': instance.txnProductName,
      'newRoute': instance.newRoute,
    };
