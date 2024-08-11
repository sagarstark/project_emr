import 'dart:convert';

import 'package:flutter/foundation.dart';

class AllBranchRes {
  final bool? status;
  final String? message;
  final List<BranchData>? data;
  final int? statusCode;
  AllBranchRes({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  AllBranchRes copyWith({
    bool? status,
    String? message,
    List<BranchData>? data,
    int? statusCode,
  }) {
    return AllBranchRes(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
      'statusCode': statusCode,
    };
  }

  factory AllBranchRes.fromMap(Map<String, dynamic> map) {
    return AllBranchRes(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<BranchData>.from(
              (map['data'] as List<dynamic>).map<BranchData?>(
                (x) => BranchData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllBranchRes.fromJson(String source) =>
      AllBranchRes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllBranchRes(status: $status, message: $message, data: $data, statusCode: $statusCode)';
  }

  @override
  bool operator ==(covariant AllBranchRes other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        listEquals(other.data, data) &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        message.hashCode ^
        data.hashCode ^
        statusCode.hashCode;
  }
}

class BranchData {
  final int? branchId;
  final String? branchName;
  final String? createdOn;
  final String? updatedOn;
  final bool? isActive;
  final bool? isDeleted;
  BranchData({
    this.branchId,
    this.branchName,
    this.createdOn,
    this.updatedOn,
    this.isActive,
    this.isDeleted,
  });

  BranchData copyWith({
    int? branchId,
    String? branchName,
    String? createdOn,
    String? updatedOn,
    bool? isActive,
    bool? isDeleted,
  }) {
    return BranchData(
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchId': branchId,
      'branchName': branchName,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }

  factory BranchData.fromMap(Map<String, dynamic> map) {
    return BranchData(
      branchId: map['branchId'] != null ? map['branchId'] as int : null,
      branchName:
          map['branchName'] != null ? map['branchName'] as String : null,
      createdOn: map['createdOn'] != null ? map['createdOn'] as String : null,
      updatedOn: map['updatedOn'] != null ? map['updatedOn'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BranchData.fromJson(String source) =>
      BranchData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BranchData(branchId: $branchId, branchName: $branchName, createdOn: $createdOn, updatedOn: $updatedOn, isActive: $isActive, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant BranchData other) {
    if (identical(this, other)) return true;

    return other.branchId == branchId &&
        other.branchName == branchName &&
        other.createdOn == createdOn &&
        other.updatedOn == updatedOn &&
        other.isActive == isActive &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return branchId.hashCode ^
        branchName.hashCode ^
        createdOn.hashCode ^
        updatedOn.hashCode ^
        isActive.hashCode ^
        isDeleted.hashCode;
  }
}
