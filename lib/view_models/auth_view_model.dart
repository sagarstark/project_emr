import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

import '../repositories/repositories.dart';

class AuthViewModel {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  var dbWrapper = Get.find<DBWrapper>();

  /// Sign In API
  ///
  Future<LoginRes?> signIn({
    required String userName,
    required String password,
  }) async {
    var response = await _repository.signIn(
      userName: userName,
      password: password,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    dbWrapper.saveValue(LocalKeys.isLoggedIn, status);
    if (status == 'false') {
      Utility.showDialog(data['message'].toString());
      return null;
    } else {
      dbWrapper.saveValue(LocalKeys.fullName, '${data['data']['fullName']}');
      RouteManagement.goToSelectBranch();
    }
    return LoginRes.fromMap(data);
  }
}
