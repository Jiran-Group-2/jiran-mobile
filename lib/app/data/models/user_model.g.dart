// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: (json['userId'] as num?)?.toInt(),
      userLogin: json['userLogin'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      titleId: (json['titleId'] as num?)?.toInt(),
      nric: json['nric'] as String?,
      unitNumberId: (json['unitNumberId'] as num?)?.toInt(),
      email: json['email'],
      mobileNo: json['mobileNo'] as String?,
      homeNo: json['homeNo'] as String?,
      status: json['status'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      roleId: (json['roleId'] as num?)?.toInt(),
      role: json['role'] == null
          ? null
          : RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      systemId: (json['systemId'] as num?)?.toInt(),
      system: json['system'] == null
          ? null
          : SystemModel.fromJson(json['system'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      unitNumber: json['unitNumber'] == null
          ? null
          : UnitNumberModel.fromJson(
              json['unitNumber'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'userLogin': instance.userLogin,
      'password': instance.password,
      'name': instance.name,
      'titleId': instance.titleId,
      'nric': instance.nric,
      'unitNumberId': instance.unitNumberId,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'homeNo': instance.homeNo,
      'status': instance.status,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'roleId': instance.roleId,
      'role': instance.role,
      'systemId': instance.systemId,
      'system': instance.system,
      'title': instance.title,
      'unitNumber': instance.unitNumber,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      roleId: (json['roleId'] as num?)?.toInt(),
      roleName: json['roleName'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'roleId': instance.roleId,
      'roleName': instance.roleName,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
    };

SystemModel _$SystemModelFromJson(Map<String, dynamic> json) => SystemModel(
      systemId: (json['systemId'] as num?)?.toInt(),
      version: json['version'] as String?,
      areaName: json['areaName'] as String?,
      address: json['address'] as String?,
      officeNumber1: json['officeNumber1'] as String?,
      officeNumber2: json['officeNumber2'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SystemModelToJson(SystemModel instance) =>
    <String, dynamic>{
      'systemId': instance.systemId,
      'version': instance.version,
      'areaName': instance.areaName,
      'address': instance.address,
      'officeNumber1': instance.officeNumber1,
      'officeNumber2': instance.officeNumber2,
      'fax': instance.fax,
      'email': instance.email,
    };

TitleModel _$TitleModelFromJson(Map<String, dynamic> json) => TitleModel(
      titleId: (json['titleId'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TitleModelToJson(TitleModel instance) =>
    <String, dynamic>{
      'titleId': instance.titleId,
      'title': instance.title,
    };

UnitNumberModel _$UnitNumberModelFromJson(Map<String, dynamic> json) =>
    UnitNumberModel(
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
          : BlockModel.fromJson(json['block'] as Map<String, dynamic>),
      floor: json['floor'] == null
          ? null
          : FloorModel.fromJson(json['floor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnitNumberModelToJson(UnitNumberModel instance) =>
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

BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => BlockModel(
      blockId: (json['blockId'] as num?)?.toInt(),
      blockName: json['blockName'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      systemId: (json['systemId'] as num?)?.toInt(),
      system: json['system'] == null
          ? null
          : SystemModel.fromJson(json['system'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlockModelToJson(BlockModel instance) =>
    <String, dynamic>{
      'blockId': instance.blockId,
      'blockName': instance.blockName,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'systemId': instance.systemId,
      'system': instance.system,
    };

FloorModel _$FloorModelFromJson(Map<String, dynamic> json) => FloorModel(
      floorId: (json['floorId'] as num?)?.toInt(),
      floorName: json['floorName'] as String?,
      blockId: (json['blockId'] as num?)?.toInt(),
      createdById: (json['createdById'] as num?)?.toInt(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      block: json['block'] == null
          ? null
          : BlockModel.fromJson(json['block'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FloorModelToJson(FloorModel instance) =>
    <String, dynamic>{
      'floorId': instance.floorId,
      'floorName': instance.floorName,
      'blockId': instance.blockId,
      'createdById': instance.createdById,
      'createdDate': instance.createdDate?.toIso8601String(),
      'block': instance.block,
    };
