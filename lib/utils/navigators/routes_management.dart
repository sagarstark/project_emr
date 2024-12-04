import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Go to the SignIn Screen
  static void goToLogIn() {
    Get.offAllNamed<void>(
      Routes.login,
    );
  }

  static void goToOnboarding() {
    Get.offAllNamed<void>(
      Routes.onboarding,
    );
  }

  /// Go to the Home Screen
  static void goToHome() {
    Get.offAllNamed<void>(
      Routes.home,
    );
  }

  static void goToSelectBranch() {
    Get.toNamed<void>(
      Routes.selectBranch,
    );
  }

  static void goToReceptionistHome() {
    Get.toNamed<void>(
      Routes.receptionistHome,
    );
  }

  static void goToforgotPassword() {
    Get.toNamed<void>(
      Routes.forgotPassword,
    );
  }

  static void goToPatientSchedule() {
    Get.toNamed<void>(
      Routes.patientSchedule,
    );
  }

  static void goToCheckAvailability({
    required String doctorId,
    required String doctorName,
    required String contactInfo,
    required String branch,
  }) {
    Get.toNamed<void>(
      Routes.checkAvailability,
      arguments: {
        'doctorId': doctorId,
        'doctorName': doctorName,
        'contactInfo': contactInfo,
        'branch': branch,
      },
    );
  }

  static void goToFilterAvailability() {
    Get.toNamed<void>(
      Routes.filterAvailability,
    );
  }

  static void goToPatientHome() {
    Get.offAllNamed<void>(
      Routes.patientHome,
    );
  }

  static void goToPatientBookAppointment() {
    Get.toNamed<void>(
      Routes.patientBookAppointment,
    );
  }

  static void goToPatientDetailsForm() {
    Get.toNamed<void>(
      Routes.patientDetailsForm,
    );
  }

  static void goToAddDependents() {
    Get.toNamed<void>(
      Routes.addDependents,
    );
  }

  static void goToUploadDocuments() {
    Get.toNamed<void>(
      Routes.uploadDocuments,
    );
  }

  static void goToDoctorsHome() {
    Get.toNamed<void>(
      Routes.doctorsHome,
    );
  }

  static void goToDoctorsAppointment() {
    Get.toNamed<void>(
      Routes.doctorsAppointment,
    );
  }

  static void goToPatientList() {
    Get.toNamed<void>(
      Routes.patientList,
    );
  }

  static void goToPatientDetails() {
    Get.toNamed<void>(
      Routes.patientDetails,
    );
  }

  static void goToOrderMedicine() {
    Get.toNamed<void>(
      Routes.orderMedicine,
    );
  }

  static void goToOrderLabTest() {
    Get.toNamed<void>(
      Routes.orderLabTest,
    );
  }

  static void goToPharmacyNotification() {
    Get.toNamed<void>(
      Routes.pharmacyNotification,
    );
  }

  static void goToPharmacyHome() {
    Get.offAllNamed<void>(
      Routes.pharmacyHome,
    );
  }

  static void goToPharmacyOrderDetails() {
    Get.toNamed<void>(
      Routes.pharmacyOrderDetails,
    );
  }

  static void goToReceptionistPatientList() {
    Get.toNamed<void>(
      Routes.receptionistPatientList,
    );
  }

  static void goToDoctorsProfile() {
    Get.toNamed<void>(
      Routes.doctorsProfile,
    );
  }

  static void goToPatientSearchDoctors() {
    Get.toNamed<void>(
      Routes.patientSearchDoctors,
    );
  }

  static void goToAddNewPatient() {
    Get.toNamed<void>(
      Routes.addNewPatient,
    );
  }

  static void goToPrescriptionsList() {
    Get.toNamed<void>(
      Routes.prescriptionsList,
    );
  }

  static void goToPrescriptionPdfList() {
    Get.toNamed<void>(
      Routes.prescriptionPdfList,
    );
  }

  static void goToRevenueInfo() {
    Get.toNamed<void>(
      Routes.revenueInfo,
    );
  }

  static void goToMyAttachments() {
    Get.toNamed<void>(
      Routes.myAttachments,
    );
  }

  static void goToReportsList() {
    Get.toNamed<void>(
      Routes.reportsList,
    );
  }

  static void goToReportsPdfList() {
    Get.toNamed<void>(
      Routes.reportsPdfList,
    );
  }

  static void goToLabReportsList() {
    Get.toNamed<void>(
      Routes.labReportsList,
    );
  }
}
