import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/data/data.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/utils/utils.dart';

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

  var selectedDuration = '15 minutes';

  List<String> durationList = [
    '15 minutes',
    '30 minutes',
    '45 minutes',
    '60 minutes',
  ];

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

  AllBranchRes? allBranchRes;

  var isBranchesLoading = false;

  Future<void> getAllBranches() async {
    isBranchesLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update(['select-branch']);
    });
    allBranchRes = await _viewModel.getAllBranches();
    isBranchesLoading = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update(['select-branch']);
    });
  }

  var selectedBranchId = '';

  var selectedSpecialityId = '';

  AllSpecialistRes? allSpecialistRes;

  var isSpecializationLoading = false;

  Future<void> getAllSpecialities() async {
    isSpecializationLoading = true;
    update(['filter-availability']);
    allSpecialistRes = await _viewModel.getAllSpecialities();
    isSpecializationLoading = false;
    update(['filter-availability']);
  }

  FilterDoctorModel? filterDoctorModel;

  var isFilterDoctorLoading = false;

  var showAvailableDoctorsList = false;

  Future<void> getAvailableDoctor() async {
    isFilterDoctorLoading = true;
    update(['filter-availability']);
    filterDoctorModel = await _viewModel.getAvailableDoctor(
      // TODO: Change to actual Date
      // date: DateFormat('yyyy-MM-dd').format(selectedAvailabilityDate),
      date: '2024-09-22',
      branchId: selectedBranchId,
      specialityId: selectedSpecialityId,
    );
    isFilterDoctorLoading = false;
    showAvailableDoctorsList = true;
    update(['filter-availability']);
  }

  int? selectedDoctorIndex;

  void selectDoctor(int index) {
    selectedDoctorIndex = index;
    update(['filter-availability']);
  }

  void validateAvailability() async {
    if (availabilityDateController.text.isEmpty ||
        selectedBranchId.isEmpty ||
        selectedSpecialityId.isEmpty) {
      Utility.showMessage(
          message:
              'Please select all the three fields to find the appropriate Doctor for yourself.',
          type: MessageType.error);
    } else {
      getAvailableDoctor();
    }
  }
}
