// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      userBillId: (json['userBillId'] as num?)?.toInt(),
      billId: (json['billId'] as num?)?.toInt(),
      unitNumberId: (json['unitNumberId'] as num?)?.toInt(),
      userId: json['userId'],
      amount: (json['amount'] as num?)?.toDouble(),
      paid: (json['paid'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toDouble(),
      createdById: json['createdById'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      systemId: (json['systemId'] as num?)?.toInt(),
      system: json['system'],
      unitNumber: json['unitNumber'] == null
          ? null
          : UnitNumber.fromJson(json['unitNumber'] as Map<String, dynamic>),
      bill: json['bill'] == null
          ? null
          : Bill.fromJson(json['bill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) => <String, dynamic>{
      'userBillId': instance.userBillId,
      'billId': instance.billId,
      'unitNumberId': instance.unitNumberId,
      'userId': instance.userId,
      'amount': instance.amount,
      'paid': instance.paid,
      'balance': instance.balance,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'systemId': instance.systemId,
      'system': instance.system,
      'unitNumber': instance.unitNumber,
      'bill': instance.bill,
    };

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      billId: (json['billId'] as num?)?.toInt(),
      billSubject: json['billSubject'] as String?,
      billDescription: json['billDescription'] as String?,
      billRate: (json['billRate'] as num?)?.toInt(),
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'billId': instance.billId,
      'billSubject': instance.billSubject,
      'billDescription': instance.billDescription,
      'billRate': instance.billRate,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
    };

UnitNumber _$UnitNumberFromJson(Map<String, dynamic> json) => UnitNumber(
      unitNumberId: (json['unitNumberId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      unitNumber: json['unitNumber'] as String?,
      blockId: (json['blockId'] as num?)?.toInt(),
      floorId: (json['floorId'] as num?)?.toInt(),
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      block: json['block'] == null
          ? null
          : Block.fromJson(json['block'] as Map<String, dynamic>),
      floor: json['floor'] == null
          ? null
          : Floor.fromJson(json['floor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnitNumberToJson(UnitNumber instance) =>
    <String, dynamic>{
      'unitNumberId': instance.unitNumberId,
      'userId': instance.userId,
      'unitNumber': instance.unitNumber,
      'blockId': instance.blockId,
      'floorId': instance.floorId,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'block': instance.block,
      'floor': instance.floor,
    };

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      blockId: (json['blockId'] as num?)?.toInt(),
      blockName: json['blockName'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      systemId: (json['systemId'] as num?)?.toInt(),
      system: json['system'],
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'blockId': instance.blockId,
      'blockName': instance.blockName,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'systemId': instance.systemId,
      'system': instance.system,
    };

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      floorId: (json['floorId'] as num?)?.toInt(),
      floorName: json['floorName'] as String?,
      blockId: (json['blockId'] as num?)?.toInt(),
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      block: json['block'] == null
          ? null
          : Block.fromJson(json['block'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'floorId': instance.floorId,
      'floorName': instance.floorName,
      'blockId': instance.blockId,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'block': instance.block,
    };

PayBillRequest _$PayBillRequestFromJson(Map<String, dynamic> json) =>
    PayBillRequest(
      unitNumberId: (json['unitNumberId'] as num).toInt(),
      providedPaid: (json['providedPaid'] as num).toDouble(),
    );

Map<String, dynamic> _$PayBillRequestToJson(PayBillRequest instance) =>
    <String, dynamic>{
      'unitNumberId': instance.unitNumberId,
      'providedPaid': instance.providedPaid,
    };
