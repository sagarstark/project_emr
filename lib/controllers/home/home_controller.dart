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

  @override
  void onInit() async {
    super.onInit();
    var data = await HiveManager.getData(LocalKeys.userSigninData);
    signInData = signInModelFromJson(data);
  }

  SignInModel? signInData;

  var availabilityDateController = TextEditingController();

  var selectedAvailabilityDate = DateTime.now();

  var finalSelectedAvailabilityDate = DateTime.now();

  var selectedDuration = 15;

  var selectedSlot = '';

  int? selectedPatientId;
  int? selectedDocId;

  List<int> durationList = [15, 30, 45, 60];

  final List<String> timeSlots = [
    '09:00 AM - 09:15 AM',
    '09:15 AM - 09:30 AM',
    '09:30 AM - 09:45 AM',
    '09:45 AM - 10:00 AM',
    '10:00 AM - 10:15 AM',
    '10:15 AM - 10:30 AM',
    '10:30 AM - 10:45 AM',
    '10:45 AM - 11:00 AM',
    '11:00 AM - 11:15 AM',
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update(['filter-availability']);
    });

    allSpecialistRes = await _viewModel.getAllSpecialities();
    isSpecializationLoading = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update(['filter-availability']);
    });
  }

  FilterDoctorModel? filterDoctorModel;

  var isFilterDoctorLoading = false;

  var showAvailableDoctorsList = false;

  Future<void> getAvailableDoctor() async {
    isFilterDoctorLoading = true;
    update(['filter-availability']);
    filterDoctorModel = await _viewModel.getAvailableDoctor(
      date: DateFormat('yyyy-MM-dd').format(selectedAvailabilityDate),
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
          type: MessageType.information);
    } else {
      getAvailableDoctor();
    }
  }

  PatientResponseModel? patientResponseModel;

  var isPatientListLoading = false;

  var searchPatientTextController = TextEditingController();

  Future<void> getPatientList([String searchText = '']) async {
    isPatientListLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update(['receptionist-patient-list']);
    });
    patientResponseModel = await _viewModel.getPatientList(
        searchText: searchPatientTextController.text);
    isPatientListLoading = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update(['receptionist-patient-list']);
    });
  }

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final problemController = TextEditingController();
  final symptomsController = TextEditingController();

  DateTime? newPatientDOB;

  Future<void> createPatient() async {
    await _viewModel.createNewPatient(
      name: nameController.text,
      dob: DateFormat('yyyy-MM-dd').format(newPatientDOB!),
      age: DateTime.now().year - newPatientDOB!.year,
      gender: genderController.text,
      phoneNo: phoneController.text,
      emailId: emailController.text,
      address: addressController.text,
      problem: problemController.text,
      symptoms: symptomsController.text,
    );
  }

  bool isValidForm() {
    return nameController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        problemController.text.isNotEmpty &&
        symptomsController.text.isNotEmpty;
  }

  void clearAllFields() {
    nameController.clear();
    dobController.clear();
    genderController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    problemController.clear();
    symptomsController.clear();
    newPatientDOB = null;
    update(['add-new-patient']);
  }

  var slotCurrentTab = 'Morning';

  DoctorsAvailableSlot? doctorsAvailableSlot;

  var isGetDoctorSlotLoading = false;

  Future<void> getDoctorAvailableSlots({
    required String doctorId,
    required String interval,
    required String selectedDate,
  }) async {
    selectedSlot = '';
    isGetDoctorSlotLoading = true;
    update(['check-availability']);
    doctorsAvailableSlot = await _viewModel.getDoctorAvailableSlots(
      doctorId: doctorId,
      interval: interval,
      selectedDate: selectedDate,
    );
    isGetDoctorSlotLoading = false;
    update(['check-availability']);
  }

  Future<void> receptionistBookAppointment() async {
    await _viewModel.receptionistBookAppointment(
      patientId: selectedPatientId ?? 0,
      docId: selectedDocId ?? 0,
      specialityId: int.parse(selectedSpecialityId),
      branchId: int.parse(selectedBranchId),
      appointmentDate:
          DateFormat('yyyy-MM-dd').format(finalSelectedAvailabilityDate),
      appointmentTime: selectedSlot,
      timeInterval: '$selectedDuration',
      scheduleType: slotCurrentTab,
    );
  }

  DoctorsAppointmentModel? doctorsAppointmentModel;

  var isAppointmentLoading = false;

  Future<void> getDoctorsAppointment(
      {required String filters, required String updateId}) async {
    isAppointmentLoading = true;
    doctorsAppointmentModel = await _viewModel.getDoctorsAppointment(
      doctorId: '${signInData?.data?.id}',
      filters: filters,
    );
    isAppointmentLoading = false;
    update([updateId]);
  }

  var isDoctorsPatientList = false;

  DoctorsPatientListModel? doctorsPatientListModel;

  Future<void> getPatientsByDoctorsId(
      {required String filters, required String updateId}) async {
    doctorsPatientListModel = null;
    isDoctorsPatientList = true;
    doctorsPatientListModel = await _viewModel.getPatientsByDoctorsId(
      doctorId: '4',
      filters: filters,
    );
    isDoctorsPatientList = false;
    update([updateId]);
  }
}
