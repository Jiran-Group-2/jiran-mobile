import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable(explicitToJson: true)
class UserModel {
    final int? userId;
    final String? userLogin;
    final String? password;
    final String? name;
    final int? titleId;
    final String? nric;
    final int? unitNumberId;
    final dynamic email;
    final String? mobileNo;
    final String? homeNo;
    final String? status;
    final int? createdById;
    final DateTime? createdDate;
    final int? roleId;
    final RoleModel? role;
    final int? systemId;
    final SystemModel? system;
    final TitleModel? title;
    final UnitNumberModel? unitNumber;

    UserModel({
        this.userId,
        this.userLogin,
        this.password,
        this.name,
        this.titleId,
        this.nric,
        this.unitNumberId,
        this.email,
        this.mobileNo,
        this.homeNo,
        this.status,
        this.createdById,
        this.createdDate,
        this.roleId,
        this.role,
        this.systemId,
        this.system,
        this.title,
        this.unitNumber,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RoleModel {
    final int? roleId;
    final String? roleName;
    final int? createdById;
    final DateTime? createdDate;

    RoleModel({
        this.roleId,
        this.roleName,
        this.createdById,
        this.createdDate,
    });

    factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

    Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SystemModel {
    final int? systemId;
    final String? version;
    final String? areaName;
    final String? address;
    final String? officeNumber1;
    final String? officeNumber2;
    final String? fax;
    final String? email;

    SystemModel({
        this.systemId,
        this.version,
        this.areaName,
        this.address,
        this.officeNumber1,
        this.officeNumber2,
        this.fax,
        this.email,
    });

    factory SystemModel.fromJson(Map<String, dynamic> json) => _$SystemModelFromJson(json);

    Map<String, dynamic> toJson() => _$SystemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TitleModel {
    final int? titleId;
    final String? title;

    TitleModel({
        this.titleId,
        this.title,
    });

    factory TitleModel.fromJson(Map<String, dynamic> json) => _$TitleModelFromJson(json);

    Map<String, dynamic> toJson() => _$TitleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnitNumberModel {
    final int? unitNumberId;
    final int? userId;
    final String? unitNumber;
    final int? blockId;
    final int? floorId;
    final int? createdById;
    final DateTime? createdDate;
    final BlockModel? block;
    final FloorModel? floor;

    UnitNumberModel({
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

    factory UnitNumberModel.fromJson(Map<String, dynamic> json) => _$UnitNumberModelFromJson(json);

    Map<String, dynamic> toJson() => _$UnitNumberModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BlockModel {
    final int? blockId;
    final String? blockName;
    final int? createdById;
    final DateTime? createdDate;
    final int? systemId;
    final SystemModel? system;

    BlockModel({
        this.blockId,
        this.blockName,
        this.createdById,
        this.createdDate,
        this.systemId,
        this.system,
    });

    factory BlockModel.fromJson(Map<String, dynamic> json) => _$BlockModelFromJson(json);

    Map<String, dynamic> toJson() => _$BlockModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FloorModel {
    final int? floorId;
    final String? floorName;
    final int? blockId;
    final int? createdById;
    final DateTime? createdDate;
    final BlockModel? block;

    FloorModel({
        this.floorId,
        this.floorName,
        this.blockId,
        this.createdById,
        this.createdDate,
        this.block,
    });

    factory FloorModel.fromJson(Map<String, dynamic> json) => _$FloorModelFromJson(json);

    Map<String, dynamic> toJson() => _$FloorModelToJson(this);
}
