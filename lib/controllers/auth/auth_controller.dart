import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_emr/utils/utils.dart';

import '../../view_models/view_models.dart';

class AuthController extends GetxController {
  AuthController(this._viewModel);

  final AuthViewModel _viewModel;

  var hidePassword = true;

  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  void signIn() async {
    await _viewModel.signIn(
      userName: usernameTextController.text,
      password: passwordTextController.text,
    );
  }
}
