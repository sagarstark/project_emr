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

  Future<ResponseModel> getAvailableDoctor({
    required String date,
    required String branchId,
    required String specialityId,
  }) async {
    return _apiWrapper.makeRequest(
      '${Apis.getAvailableDoctor}?date=$date&branchId=$branchId&specialityId=$specialityId',
      type: RequestType.get,
      headers: {
        'Content-Type': 'application/json',
      },
      showLoader: true,
    );
  }

  Future<ResponseModel> getPatientList({
    required String searchText,
  }) async {
    return _apiWrapper.makeRequest(
      '${Apis.getPatientList}${searchText.isNotEmpty ? '?searchKey=$searchText' : ''}',
      type: RequestType.get,
      headers: {
        'Content-Type': 'application/json',
      },
      showLoader: false,
    );
  }
}
