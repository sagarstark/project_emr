// To parse this JSON data, do
//
//     final filterDoctorModel = filterDoctorModelFromJson(jsonString);

import 'dart:convert';

FilterDoctorModel filterDoctorModelFromJson(String str) =>
    FilterDoctorModel.fromJson(json.decode(str));

String filterDoctorModelToJson(FilterDoctorModel data) =>
    json.encode(data.toJson());

class FilterDoctorModel {
  final bool? status;
  final String? message;
  final List<DoctorData>? data;
  final int? statusCode;

  FilterDoctorModel({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory FilterDoctorModel.fromJson(Map<String, dynamic> json) =>
      FilterDoctorModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DoctorData>.from(
                json["data"]!.map((x) => DoctorData.fromJson(x))),
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

class DoctorData {
  final int? id;
  final Doctor? doctor;
  final BranchMaster? branchMaster;
  final String? date;
  final String? startTime;
  final String? endTime;
  final bool? status;

  DoctorData({
    this.id,
    this.doctor,
    this.branchMaster,
    this.date,
    this.startTime,
    this.endTime,
    this.status,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
        id: json["id"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        branchMaster: json["branchMaster"] == null
            ? null
            : BranchMaster.fromJson(json["branchMaster"]),
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor": doctor?.toJson(),
        "branchMaster": branchMaster?.toJson(),
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
      };
}

class BranchMaster {
  final int? branchId;
  final String? branchName;
  final DateTime? createdOn;
  final DateTime? updatedOn;
  final bool? isActive;
  final bool? isDeleted;

  BranchMaster({
    this.branchId,
    this.branchName,
    this.createdOn,
    this.updatedOn,
    this.isActive,
    this.isDeleted,
  });

  factory BranchMaster.fromJson(Map<String, dynamic> json) => BranchMaster(
        branchId: json["branchId"],
        branchName: json["branchName"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        updatedOn: json["updatedOn"] == null
            ? null
            : DateTime.parse(json["updatedOn"]),
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchId,
        "branchName": branchName,
        "createdOn": createdOn?.toIso8601String(),
        "updatedOn": updatedOn?.toIso8601String(),
        "isActive": isActive,
        "isDeleted": isDeleted,
      };
}

class Doctor {
  final int? doctorId;
  final BranchMaster? branchMaster;
  final bool? active;
  final String? name;
  final String? experience;
  final String? contactInfo;

  Doctor({
    this.doctorId,
    this.branchMaster,
    this.active,
    this.name,
    this.experience,
    this.contactInfo,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        doctorId: json["doctorId"],
        branchMaster: json["branchMaster"] == null
            ? null
            : BranchMaster.fromJson(json["branchMaster"]),
        active: json["active"],
        name: json["name"],
        experience: json["experience"],
        contactInfo: json["contactInfo"],
      );

  Map<String, dynamic> toJson() => {
        "doctorId": doctorId,
        "branchMaster": branchMaster?.toJson(),
        "active": active,
        "name": name,
        "experience": experience,
        "contactInfo": contactInfo,
      };
}
