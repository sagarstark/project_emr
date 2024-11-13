class PatientResponseModel {
  final bool status;
  final String message;
  final List<PatientModel> data;
  final int statusCode;

  PatientResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory PatientResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List?)
              ?.map((e) => PatientModel.fromJson(e))
              .toList() ??
          [],
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class PatientModel {
  final int? patientId;
  final String? profile;
  final String? nationalId;
  final String? mrdNo;
  final String? name;
  final DateTime? dob;
  final int? age;
  final String? gender;
  final String? emailId;
  final String? nationality;
  final String? maritalStatus;
  final String? visaType;
  final String? otherId;
  final String? occupation;
  final String? address;
  final String? phoneNo;
  final String? insuranceName;
  final String? problem;
  final String? symptoms;
  final DateTime? createdOn;
  final String? createdBy;
  final DateTime? updateOn;
  final String? updatedBy;
  final String? status;
  final String? referralCase;
  final String? language;
  final String? region;
  final String? referredBy;
  final String? infoSource;
  final String? patientPriority;
  final String? landPhone;
  final String? place;
  final String? patientRemarks;
  final String? paymentType;

  PatientModel({
    this.patientId,
    this.profile,
    this.nationalId,
    this.mrdNo,
    this.name,
    this.dob,
    this.age,
    this.gender,
    this.emailId,
    this.nationality,
    this.maritalStatus,
    this.visaType,
    this.otherId,
    this.occupation,
    this.address,
    this.phoneNo,
    this.insuranceName,
    this.problem,
    this.symptoms,
    this.createdOn,
    this.createdBy,
    this.updateOn,
    this.updatedBy,
    this.status,
    this.referralCase,
    this.language,
    this.region,
    this.referredBy,
    this.infoSource,
    this.patientPriority,
    this.landPhone,
    this.place,
    this.patientRemarks,
    this.paymentType,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      patientId: json['patientId'] ?? 0,
      profile: json['profile'] ?? '',
      nationalId: json['nationalId'] ?? '',
      mrdNo: json['mrdNo'] ?? '',
      name: json['name'] ?? '',
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      emailId: json['emailId'] ?? '',
      nationality: json['nationality'] ?? '',
      maritalStatus: json['maritalStatus'] ?? '',
      visaType: json['visaType'] ?? '',
      otherId: json['otherId'] ?? '',
      occupation: json['occupation'] ?? '',
      address: json['address'] ?? '',
      phoneNo: json['phoneNo'] ?? '',
      insuranceName: json['insuranceName'] ?? '',
      problem: json['problem'] ?? '',
      symptoms: json['symptoms'] ?? '',
      createdOn:
          json['createdOn'] != null ? DateTime.parse(json['createdOn']) : null,
      createdBy: json['createdBy'] ?? '',
      updateOn:
          json['updateOn'] != null ? DateTime.parse(json['updateOn']) : null,
      updatedBy: json['updatedBy'] ?? '',
      status: json['status'] ?? '',
      referralCase: json['referralCase'] ?? '',
      language: json['language'] ?? '',
      region: json['region'] ?? '',
      referredBy: json['referredBy'] ?? '',
      infoSource: json['infoSource'] ?? '',
      patientPriority: json['patientPriority'] ?? '',
      landPhone: json['landPhone'] ?? '',
      place: json['place'] ?? '',
      patientRemarks: json['patientRemarks'] ?? '',
      paymentType: json['paymentType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'profile': profile,
      'nationalId': nationalId,
      'mrdNo': mrdNo,
      'name': name,
      'dob': dob?.toIso8601String(),
      'age': age,
      'gender': gender,
      'emailId': emailId,
      'nationality': nationality,
      'maritalStatus': maritalStatus,
      'visaType': visaType,
      'otherId': otherId,
      'occupation': occupation,
      'address': address,
      'phoneNo': phoneNo,
      'insuranceName': insuranceName,
      'problem': problem,
      'symptoms': symptoms,
      'createdOn': createdOn?.toIso8601String(),
      'createdBy': createdBy,
      'updateOn': updateOn?.toIso8601String(),
      'updatedBy': updatedBy,
      'status': status,
      'referralCase': referralCase,
      'language': language,
      'region': region,
      'referredBy': referredBy,
      'infoSource': infoSource,
      'patientPriority': patientPriority,
      'landPhone': landPhone,
      'place': place,
      'patientRemarks': patientRemarks,
      'paymentType': paymentType,
    };
  }
}
