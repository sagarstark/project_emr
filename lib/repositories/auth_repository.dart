import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

class AuthRepository {
  AuthRepository();
  final _apiWrapper = Get.put(ApiWrapper());

  /// Member Login 1st API
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
}
