import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';

import '../../utils/utils.dart';

class SplashController extends GetxController {
  var dbWrapper = Get.put(DBWrapper());

  @override
  void onInit() {
    super.onInit();
    startOnInit();
  }

  var isLoggedIn = '';

  void startOnInit() async {
    isLoggedIn = dbWrapper.getStringValue(LocalKeys.isLoggedIn);
    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn == 'true') {
      RouteManagement.goToSelectBranch();
    } else {
      RouteManagement.goToOnboarding();
    }
  }
}
