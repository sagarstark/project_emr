import 'dart:convert';

DoctorsAvailableSlot doctorsAvailableSlotFromJson(String str) =>
    DoctorsAvailableSlot.fromJson(json.decode(str));

String doctorsAvailableSlotToJson(DoctorsAvailableSlot data) =>
    json.encode(data.toJson());

class DoctorsAvailableSlot {
  final SlotType? morning;
  final SlotType? afternoon;
  final SlotType? evening;

  DoctorsAvailableSlot({
    this.morning,
    this.afternoon,
    this.evening,
  });

  factory DoctorsAvailableSlot.fromJson(Map<String, dynamic> json) =>
      DoctorsAvailableSlot(
        morning:
            json["morning"] == null ? null : SlotType.fromJson(json["morning"]),
        afternoon: json["afternoon"] == null
            ? null
            : SlotType.fromJson(json["afternoon"]),
        evening:
            json["evening"] == null ? null : SlotType.fromJson(json["evening"]),
      );

  Map<String, dynamic> toJson() => {
        "morning": morning?.toJson(),
        "afternoon": afternoon?.toJson(),
        "evening": evening?.toJson(),
      };
}

class SlotType {
  final List<SlotData>? available;
  final List<SlotData>? booked;

  SlotType({
    this.available,
    this.booked,
  });

  factory SlotType.fromJson(Map<String, dynamic> json) => SlotType(
        available: json["available"] == null
            ? []
            : List<SlotData>.from(
                json["available"]!.map((x) => SlotData.fromJson(x))),
        booked: json["booked"] == null
            ? []
            : List<SlotData>.from(
                json["booked"]!.map((x) => SlotData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available == null
            ? []
            : List<dynamic>.from(available!.map((x) => x.toJson())),
        "booked":
            booked == null ? [] : List<dynamic>.from(booked!.map((x) => x)),
      };
}

class SlotData {
  final String? start;
  final String? end;

  SlotData({
    this.start,
    this.end,
  });

  factory SlotData.fromJson(Map<String, dynamic> json) => SlotData(
        start: json["start"] ?? '',
        end: json["end"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}
