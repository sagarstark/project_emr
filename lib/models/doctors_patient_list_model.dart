// To parse this JSON data, do
//
//     final doctorsPatientListModel = doctorsPatientListModelFromJson(jsonString);

import 'dart:convert';

DoctorsPatientListModel doctorsPatientListModelFromJson(String str) =>
    DoctorsPatientListModel.fromJson(json.decode(str));

String doctorsPatientListModelToJson(DoctorsPatientListModel data) =>
    json.encode(data.toJson());

class DoctorsPatientListModel {
  final bool? status;
  final String? message;
  final List<PatientData>? data;
  final int? statusCode;

  DoctorsPatientListModel({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory DoctorsPatientListModel.fromJson(Map<String, dynamic> json) =>
      DoctorsPatientListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PatientData>.from(
                json["data"]!.map((x) => PatientData.fromJson(x))),
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

class PatientData {
  final int? patientId;
  final String? patientName;
  final String? problem;
  final DateTime? appointmentDate;
  final String? appointmentTime;
  final String? location;

  PatientData({
    this.patientId,
    this.patientName,
    this.problem,
    this.appointmentDate,
    this.appointmentTime,
    this.location,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
        patientId: json["patientId"],
        patientName: json["patientName"],
        problem: json["problem"],
        appointmentDate: json["appointmentDate"] == null
            ? null
            : DateTime.parse(json["appointmentDate"]),
        appointmentTime: json["appointmentTime"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "patientName": patientName,
        "problem": problem,
        "appointmentDate": appointmentDate?.toIso8601String(),
        "appointmentTime": appointmentTime,
        "location": location,
      };
}
