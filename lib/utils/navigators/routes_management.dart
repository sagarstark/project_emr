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
    Get.offAllNamed<void>(
      Routes.selectBranch,
    );
  }

  static void goToReceptionistHome() {
    Get.offAllNamed<void>(
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

  static void goToCheckAvailability() {
    Get.toNamed<void>(
      Routes.checkAvailability,
    );
  }

  static void goToFilterAvailability() {
    Get.toNamed<void>(
      Routes.filterAvailability,
    );
  }

  static void goToNationalIdView() {
    Get.toNamed<void>(
      Routes.nationalIdView,
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
    Get.offAllNamed<void>(
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
}
