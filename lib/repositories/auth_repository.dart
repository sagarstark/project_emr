import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

class AuthRepository {
  AuthRepository();
  final _apiWrapper = Get.put(ApiWrapper());

  /// Sign In API
  ///
  Future<ResponseModel> signIn({
    required String userName,
    required String password,
  }) async =>
      _apiWrapper.makeRequest(
        Apis.signIn,
        type: RequestType.post,
        headers: {
          'Content-Type': 'application/json',
        },
        payload: {
          'userName': userName,
          'password': password,
        },
        showLoader: true,
      );

  /// Reset Passsword API
  ///
  Future<ResponseModel> resetPassword({
    required String userName,
    required String password,
  }) async =>
      _apiWrapper.makeRequest(
        Apis.resetPassword,
        type: RequestType.patch,
        headers: {
          'Content-Type': 'application/json',
        },
        payload: {
          'userName': userName,
          'password': password,
        },
        showLoader: true,
      );

  /// Forgot Passsword API
  ///
  Future<ResponseModel> forgotpassword({
    required String email,
  }) async =>
      _apiWrapper.makeRequest(
        '${Apis.forgotPassword}?email=$email',
        type: RequestType.get,
        headers: {
          'Content-Type': 'application/json',
        },
        showLoader: true,
      );
}
