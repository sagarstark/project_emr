import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';

import '../../view_models/view_models.dart';

class HomeController extends GetxController {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  var dbWrapper = Get.find<DBWrapper>();

  @override
  void onInit() {
    super.onInit();
    fullName = dbWrapper.getStringValue(LocalKeys.fullName);
  }

  var fullName = '';

  var availabilityDateController = TextEditingController();

  var selectedAvailabilityDate = DateTime.now();

  var finalSelectedAvailabilityDate = DateTime.now();

  var isSpecialitySelected = false;

  List<String> specialList = [
    'Cardiologist',
    'Gynacologist',
    'Neurolgist',
    'General',
    'Medicine Specialist',
    'Dentist',
  ];

  List<String> dummyBranchList = [
    'Chennai',
    'Bengaluru',
    'Hyderabad',
    'Pune',
  ];
  List<String> selectedSpecialList = [];

  AllBranchRes? allBranchRes;

  var isBranchesLoading = false;

  Future<void> getAllBranches() async {
    isBranchesLoading = true;
    update(['select-branch']);
    allBranchRes = await _viewModel.getAllBranches();
    isBranchesLoading = false;
    update(['select-branch']);
  }
}
