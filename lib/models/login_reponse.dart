import 'dart:convert';

class LoginRes {
  final bool? status;
  final String? message;
  final LoginData? data;
  final dynamic statusCode;
  LoginRes({
    this.status,
    this.message,
    this.data,
    required this.statusCode,
  });

  LoginRes copyWith({
    bool? status,
    String? message,
    LoginData? data,
    dynamic statusCode,
  }) {
    return LoginRes(
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
      'data': data?.toMap(),
      'statusCode': statusCode,
    };
  }

  factory LoginRes.fromMap(Map<String, dynamic> map) {
    return LoginRes(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? LoginData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      statusCode: map['statusCode'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRes.fromJson(String source) =>
      LoginRes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginRes(status: $status, message: $message, data: $data, statusCode: $statusCode)';
  }

  @override
  bool operator ==(covariant LoginRes other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data &&
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

class LoginData {
  final int? id;
  final String? userName;
  final String? email;
  final String? password;
  final String? fullName;
  LoginData({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.fullName,
  });

  LoginData copyWith({
    int? id,
    String? userName,
    String? email,
    String? password,
    String? fullName,
  }) {
    return LoginData(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'email': email,
      'password': password,
      'fullName': fullName,
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      id: map['id'] != null ? map['id'] as int : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginData.fromJson(String source) =>
      LoginData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginData(id: $id, userName: $userName, email: $email, password: $password, fullName: $fullName)';
  }

  @override
  bool operator ==(covariant LoginData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.email == email &&
        other.password == password &&
        other.fullName == fullName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        fullName.hashCode;
  }
}
