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

  Future<ResponseModel> createNewPatient({
    required String name,
    required String dob,
    required int age,
    required String gender,
    required String emailId,
    required String address,
    required String phoneNo,
    required String problem,
    required String symptoms,
  }) async {
    final body = {
      "name": name,
      "dob": dob,
      "age": age,
      "gender": gender,
      "emailId": emailId,
      "address": address,
      "phoneNo": phoneNo,
      "problem": problem,
      "symptoms": symptoms,
    };

    return _apiWrapper.makeRequest(
      Apis.createNewPatient, // Make sure to add this endpoint in your Apis class
      type: RequestType.post,
      headers: {
        'Content-Type': 'application/json',
      },
      payload: body,
      showLoader: true,
    );
  }
}
