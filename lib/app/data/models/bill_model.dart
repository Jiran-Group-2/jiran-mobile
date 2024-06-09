import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'bill_model.g.dart';

List<BillModel> billModelFromJson(String str) => List<BillModel>.from(json.decode(str).map((x) => BillModel.fromJson(x)));

String billModelToJson(List<BillModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class BillModel {
    final int? userBillId;
    final int? billId;
    final int? unitNumberId;
    final dynamic userId;
    final double? amount;
    final int? paid;
    final double? balance;
    final String? createdById;
    final DateTime? createdDate;
    final int? systemId;
    final dynamic system;
    final UnitNumber? unitNumber;
    final Bill? bill;
    @JsonKey(includeFromJson: false, includeToJson: false)
    final RxBool? isPending = true.obs;

    BillModel({
        this.userBillId,
        this.billId,
        this.unitNumberId,
        this.userId,
        this.amount,
        this.paid,
        this.balance,
        this.createdById,
        this.createdDate,
        this.systemId,
        this.system,
        this.unitNumber,
        this.bill,
    });

    factory BillModel.fromJson(Map<String, dynamic> json) => _$BillModelFromJson(json);

    Map<String, dynamic> toJson() => _$BillModelToJson(this);
}

@JsonSerializable()
class Bill {
    final int? billId;
    final String? billSubject;
    final String? billDescription;
    final int? billRate;
    final int? createdById;
    final DateTime? createdDate;

    Bill({
        this.billId,
        this.billSubject,
        this.billDescription,
        this.billRate,
        this.createdById,
        this.createdDate,
    });

    factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

    Map<String, dynamic> toJson() => _$BillToJson(this);
}

@JsonSerializable()
class UnitNumber {
    final int? unitNumberId;
    final int? userId;
    final String? unitNumber;
    final int? blockId;
    final int? floorId;
    final int? createdById;
    final DateTime? createdDate;
    final Block? block;
    final Floor? floor;

    UnitNumber({
        this.unitNumberId,
        this.userId,
        this.unitNumber,
        this.blockId,
        this.floorId,
        this.createdById,
        this.createdDate,
        this.block,
        this.floor,
    });

    factory UnitNumber.fromJson(Map<String, dynamic> json) => _$UnitNumberFromJson(json);

    Map<String, dynamic> toJson() => _$UnitNumberToJson(this);
}

@JsonSerializable()
class Block {
    final int? blockId;
    final String? blockName;
    final int? createdById;
    final DateTime? createdDate;
    final int? systemId;
    final dynamic system;

    Block({
        this.blockId,
        this.blockName,
        this.createdById,
        this.createdDate,
        this.systemId,
        this.system,
    });

    factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

    Map<String, dynamic> toJson() => _$BlockToJson(this);
}

@JsonSerializable()
class Floor {
    final int? floorId;
    final String? floorName;
    final int? blockId;
    final int? createdById;
    final DateTime? createdDate;
    final Block? block;

    Floor({
        this.floorId,
        this.floorName,
        this.blockId,
        this.createdById,
        this.createdDate,
        this.block,
    });

    factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

    Map<String, dynamic> toJson() => _$FloorToJson(this);
}

@JsonSerializable()
class PayBillRequest {
    final int unitNumberId;
    final double providedPaid;

  PayBillRequest({required this.unitNumberId, required this.providedPaid});

  factory PayBillRequest.fromJson(Map<String, dynamic> json) => _$PayBillRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PayBillRequestToJson(this);
}