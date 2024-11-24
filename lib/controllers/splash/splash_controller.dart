import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';

import '../../utils/utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startOnInit();
  }

  var isLoggedIn = false;

  SignInModel? signInData;

  void startOnInit() async {
    isLoggedIn = await HiveManager.getData(LocalKeys.isLoggedIn) ?? false;
    var data = await HiveManager.getData(LocalKeys.userSigninData);
    signInData = signInModelFromJson(data);
    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn) {
      switch (signInData?.data?.roleMaster?.roleId) {
        case 1: // Receptionist
          RouteManagement.goToSelectBranch();
          break;
        case 2: // Doctor
          RouteManagement.goToSelectBranch();
          break;
        case 8: // Patient
          RouteManagement.goToPatientHome();
          break;
        default:
          // Handle unknown role or error
          Utility.showDialog('Invalid Login Credentials.');
          break;
      }
    } else {
      RouteManagement.goToOnboarding();
    }
  }
}
