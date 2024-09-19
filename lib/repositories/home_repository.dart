import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

class HomeRepository {
  HomeRepository();
  final _apiWrapper = Get.put(ApiWrapper());

  Future<ResponseModel> getAllBranches() async {
    return _apiWrapper.makeRequest(
      Apis.getAllBranches,
      type: RequestType.get,
      headers: {
        'Content-Type': 'application/json',
      },
      showLoader: false,
    );
  }

  Future<ResponseModel> getAllSpecialities() async {
    return _apiWrapper.makeRequest(
      Apis.getAllSpecialities,
      type: RequestType.get,
      headers: {
        'Content-Type': 'application/json',
      },
      showLoader: false,
    );
  }
}
