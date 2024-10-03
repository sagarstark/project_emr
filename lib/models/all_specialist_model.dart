import 'dart:convert';

AllSpecialistRes allSpecialistResFromJson(String str) =>
    AllSpecialistRes.fromJson(json.decode(str));

String allSpecialistResToJson(AllSpecialistRes data) =>
    json.encode(data.toJson());

class AllSpecialistRes {
  final bool? status;
  final String? message;
  final List<AllSpecialistData>? data;
  final int? statusCode;

  AllSpecialistRes({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory AllSpecialistRes.fromJson(Map<String, dynamic> json) =>
      AllSpecialistRes(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AllSpecialistData>.from(
                json["data"]!.map((x) => AllSpecialistData.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
}

class AllSpecialistData {
  final int? specialityId;
  final String? name;
  final String? specialization;

  AllSpecialistData({
    this.specialityId,
    this.name,
    this.specialization,
  });

  factory AllSpecialistData.fromJson(Map<String, dynamic> json) =>
      AllSpecialistData(
        specialityId: json["specialityId"],
        name: json["name"],
        specialization: json["specialization"],
      );

  Map<String, dynamic> toJson() => {
        "specialityId": specialityId,
        "name": name,
        "specialization": specialization,
      };
}
