// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

import 'package:project_emr/models/models.dart';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  final bool? status;
  final String? message;
  final SignInData? data;
  final dynamic statusCode;

  SignInModel({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : SignInData.fromJson(json["data"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "statusCode": statusCode,
      };
}

class SignInData {
  final int? id;
  final String? userName;
  final String? email;
  final String? phoneNo;
  final String? password;
  final dynamic resetToken;
  final RoleMaster? roleMaster;
  final BranchMaster? branchMaster;

  SignInData({
    this.id,
    this.userName,
    this.email,
    this.phoneNo,
    this.password,
    this.resetToken,
    this.roleMaster,
    this.branchMaster,
  });

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        password: json["password"],
        resetToken: json["resetToken"],
        roleMaster: json["roleMaster"] == null
            ? null
            : RoleMaster.fromJson(json["roleMaster"]),
        branchMaster: json["branchMaster"] == null
            ? null
            : BranchMaster.fromJson(json["branchMaster"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "phoneNo": phoneNo,
        "password": password,
        "resetToken": resetToken,
        "roleMaster": roleMaster?.toJson(),
        "branchMaster": branchMaster?.toJson(),
      };
}

class RoleMaster {
  final int? roleId;
  final String? roleName;

  RoleMaster({
    this.roleId,
    this.roleName,
  });

  factory RoleMaster.fromJson(Map<String, dynamic> json) => RoleMaster(
        roleId: json["roleId"],
        roleName: json["roleName"],
      );

  Map<String, dynamic> toJson() => {
        "roleId": roleId,
        "roleName": roleName,
      };
}
