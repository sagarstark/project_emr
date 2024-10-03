import 'dart:convert';

import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

import '../repositories/repositories.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  /// Get All Branches API
  ///
  Future<AllBranchRes?> getAllBranches() async {
    var response = await _repository.getAllBranches();
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    if (status == 'false') {
      Utility.showDialog(data['message'].toString());
      return null;
    }
    return AllBranchRes.fromMap(data);
  }

  /// Get All Specialities API
  ///
  Future<AllSpecialistRes?> getAllSpecialities() async {
    var response = await _repository.getAllSpecialities();
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    if (status == 'false') {
      Utility.showDialog(data['message'].toString());
      return null;
    }
    return AllSpecialistRes.fromJson(data);
  }

  /// Filter Doctors API
  ///
  Future<FilterDoctorModel?> getAvailableDoctor({
    required String date,
    required String branchId,
    required String specialityId,
  }) async {
    var response = await _repository.getAvailableDoctor(
      date: date,
      branchId: branchId,
      specialityId: specialityId,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    if (status == 'false') {
      Utility.showDialog(data['message'].toString());
      return null;
    }
    return FilterDoctorModel.fromJson(data);
  }
}
