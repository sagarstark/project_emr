// To parse this JSON data, do
//
//     final doctorsAppointmentModel = doctorsAppointmentModelFromJson(jsonString);

import 'dart:convert';

DoctorsAppointmentModel doctorsAppointmentModelFromJson(String str) =>
    DoctorsAppointmentModel.fromJson(json.decode(str));

String doctorsAppointmentModelToJson(DoctorsAppointmentModel data) =>
    json.encode(data.toJson());

class DoctorsAppointmentModel {
  final bool? status;
  final String? message;
  final List<AppointmentData>? data;
  final int? statusCode;

  DoctorsAppointmentModel({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory DoctorsAppointmentModel.fromJson(Map<String, dynamic> json) =>
      DoctorsAppointmentModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AppointmentData>.from(
                json["data"]!.map((x) => AppointmentData.fromJson(x))),
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

class AppointmentData {
  final int? appointmentId;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? patientName;
  final String? speciality;
  final String? appointmentStatus;
  final String? status;

  AppointmentData({
    this.appointmentId,
    this.appointmentDate,
    this.appointmentTime,
    this.patientName,
    this.speciality,
    this.appointmentStatus,
    this.status,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) =>
      AppointmentData(
        appointmentId: json["appointmentId"],
        appointmentDate: json["appointmentDate"],
        appointmentTime: json["appointmentTime"],
        patientName: json["patientName"],
        speciality: json["speciality"],
        appointmentStatus: json["appointmentStatus"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "appointmentDate": appointmentDate,
        "appointmentTime": appointmentTime,
        "patientName": patientName,
        "speciality": speciality,
        "appointmentStatus": appointmentStatus,
        "status": status,
      };
}
