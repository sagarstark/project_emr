import 'dart:convert';

import 'package:get/get.dart';
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

  /// Get Patient List API
  ///
  Future<PatientResponseModel?> getPatientList({String searchText = ''}) async {
    var response = await _repository.getPatientList(searchText: searchText);
    var data = jsonDecode(response.data) as Map<String, dynamic>;
    var status = '${data['status']}';
    if (status == 'false') {
      // Utility.showDialog(data['message'].toString());
      return null;
    }
    return PatientResponseModel.fromJson(data);
  }

  Future<ResponseModel?> createNewPatient({
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
    final response = await _repository.createNewPatient(
      name: name,
      dob: dob,
      age: age,
      gender: gender,
      emailId: emailId,
      address: address,
      phoneNo: phoneNo,
      problem: problem,
      symptoms: symptoms,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;

    if (data['status'] == true) {
      Get.back();
      Utility.showDialog(data['message'].toString());
      return response;
    } else {
      return null;
    }
  }

  Future<DoctorsAvailableSlot?> getDoctorAvailableSlots({
    required String doctorId,
    required String interval,
    required String selectedDate,
  }) async {
    final response = await _repository.getDoctorAvailableSlots(
      doctorId: doctorId,
      interval: interval,
      selectedDate: selectedDate,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return DoctorsAvailableSlot.fromJson(data);
    } else {
      return null;
    }
  }

  Future<ResponseModel?> receptionistBookAppointment({
    required int patientId,
    required int docId,
    required int specialityId,
    required int branchId,
    required String appointmentDate,
    required String appointmentTime,
    required String timeInterval,
    required String scheduleType,
  }) async {
    final response = await _repository.receptionistBookAppointment(
      patientId: patientId,
      docId: docId,
      specialityId: specialityId,
      branchId: branchId,
      appointmentDate: appointmentDate,
      appointmentTime: appointmentTime,
      timeInterval: timeInterval,
      scheduleType: scheduleType,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      RouteManagement.goToReceptionistHome();
      Utility.showMessage(
        message: 'Appointment booked successfully.',
        type: MessageType.success,
      );
      return response;
    } else {
      return null;
    }
  }

  Future<DoctorsAppointmentModel?> getDoctorsAppointment({
    required String doctorId,
    required String filters,
  }) async {
    final response = await _repository.getDoctorsAppointment(
      doctorId: doctorId,
      filters: filters,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return DoctorsAppointmentModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future<DoctorsPatientListModel?> getPatientsByDoctorsId({
    required String doctorId,
    required String filters,
  }) async {
    final response = await _repository.getPatientsByDoctorsId(
      doctorId: doctorId,
      filters: filters,
    );
    var data = jsonDecode(response.data) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return DoctorsPatientListModel.fromJson(data);
    } else {
      return null;
    }
  }
}
