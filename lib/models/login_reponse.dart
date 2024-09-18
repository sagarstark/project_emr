import 'dart:convert';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  final bool? status;
  final String? message;
  final SignInData? data;
  final int? statusCode;

  SignInResponse({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
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
  final RoleMaster? roleMaster;

  SignInData({
    this.id,
    this.userName,
    this.email,
    this.phoneNo,
    this.password,
    this.roleMaster,
  });

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        password: json["password"],
        roleMaster: json["roleMaster"] == null
            ? null
            : RoleMaster.fromJson(json["roleMaster"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "phoneNo": phoneNo,
        "password": password,
        "roleMaster": roleMaster?.toJson(),
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
