import 'dart:convert';

import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

import '../repositories/repositories.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  /// Sign In API
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
}
