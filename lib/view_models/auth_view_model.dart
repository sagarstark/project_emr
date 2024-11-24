import 'dart:convert';

import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

import '../repositories/repositories.dart';

class AuthViewModel {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  /// Sign In API
  ///
  Future<SignInModel?> signIn({
    required String userName,
    required String password,
  }) async {
    var response = await _repository.signIn(
      userName: userName,
      password: password,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}' == 'true' ? true : false;
    if (status == false) {
      Utility.showDialog(data['message'].toString());
      return null;
    } else {
      await HiveManager.saveData(LocalKeys.isLoggedIn, status);
      final signInModel = SignInModel.fromJson(data);
      await HiveManager.saveData(
          LocalKeys.userSigninData, jsonEncode(signInModel.toJson()));
      final roleId = SignInModel.fromJson(data).data?.roleMaster?.roleId;
      switch (roleId) {
        case 1: // Receptionist
          RouteManagement.goToSelectBranch();
          break;
        case 2: // Doctor
          RouteManagement.goToSelectBranch();
          break;
        case 8: // Patient
          RouteManagement.goToPatientDetailsForm();
          break;
        default:
          // Handle unknown role or error
          Utility.showDialog('Invalid Login Credentials.');
          break;
      }
    }
    return SignInModel.fromJson(data);
  }

  /// Reset Password API
  ///
  Future<SignInModel?> resetPassword({
    required String userName,
    required String password,
  }) async {
    var response = await _repository.resetPassword(
      userName: userName,
      password: password,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    HiveManager.saveData(LocalKeys.isLoggedIn, status);
    if (status == 'false') {
      Utility.showDialog(data['message'].toString());
      return null;
    } else {
      // dbWrapper.saveValue(LocalKeys.fullName, '${data['data']['fullName']}');
      // RouteManagement.goToSelectBranch();
    }
    return SignInModel.fromJson(data);
  }

  /// Forgot Password API
  ///
  Future<SignInModel?> forgotPassword({
    required String email,
  }) async {
    var response = await _repository.forgotpassword(
      email: email,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    HiveManager.saveData(LocalKeys.isLoggedIn, status);
    if (status == 'false') {
      Utility.showDialog(data['message'].toString());
      return null;
    } else {
      // dbWrapper.saveValue(LocalKeys.fullName, '${data['data']['fullName']}');
      // RouteManagement.goToSelectBranch();
    }
    return SignInModel.fromJson(data);
  }
}
