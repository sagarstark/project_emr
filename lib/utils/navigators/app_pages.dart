import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/views/views.dart';
part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 350,
  );

  static const initial = Routes.splash;

  static final pages = [
    GetPage<SplashView>(
      name: Routes.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<HomeView>(
      name: Routes.home,
      transitionDuration: transitionDuration,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<AuthView>(
      name: Routes.login,
      transitionDuration: transitionDuration,
      page: AuthView.new,
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<OnboardingScreen>(
      name: Routes.onboarding,
      transitionDuration: transitionDuration,
      page: OnboardingScreen.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<SelectBranchScreen>(
      name: Routes.selectBranch,
      transitionDuration: transitionDuration,
      page: SelectBranchScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<ReceptionistHomeScreen>(
      name: Routes.receptionistHome,
      transitionDuration: transitionDuration,
      page: ReceptionistHomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<ForgotPasswordScreen>(
      name: Routes.forgotPassword,
      transitionDuration: transitionDuration,
      page: ForgotPasswordScreen.new,
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<PatientScheduleScreen>(
      name: Routes.patientSchedule,
      transitionDuration: transitionDuration,
      page: PatientScheduleScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<CheckAvailabilityScreen>(
      name: Routes.checkAvailability,
      transitionDuration: transitionDuration,
      page: CheckAvailabilityScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<FilterAvailabilityScreen>(
      name: Routes.filterAvailability,
      transitionDuration: transitionDuration,
      page: FilterAvailabilityScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<PatientHomeView>(
      name: Routes.patientHome,
      transitionDuration: transitionDuration,
      page: PatientHomeView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<PatientBookAppointmentView>(
      name: Routes.patientBookAppointment,
      transitionDuration: transitionDuration,
      page: PatientBookAppointmentView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<PatientDetailsScreen>(
      name: Routes.patientDetailsForm,
      transitionDuration: transitionDuration,
      page: PatientDetailsScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<AddDependentsView>(
      name: Routes.addDependents,
      transitionDuration: transitionDuration,
      page: AddDependentsView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<UploadDocumentsView>(
      name: Routes.uploadDocuments,
      transitionDuration: transitionDuration,
      page: UploadDocumentsView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<DoctorsHomeScreen>(
      name: Routes.doctorsHome,
      transitionDuration: transitionDuration,
      page: DoctorsHomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<DoctorsAppointmentView>(
      name: Routes.doctorsAppointment,
      transitionDuration: transitionDuration,
      page: DoctorsAppointmentView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<PatientListView>(
      name: Routes.patientList,
      transitionDuration: transitionDuration,
      page: PatientListView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<PatientDetailsView>(
      name: Routes.patientDetails,
      transitionDuration: transitionDuration,
      page: PatientDetailsView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<OrderMedicineView>(
      name: Routes.orderMedicine,
      transitionDuration: transitionDuration,
      page: OrderMedicineView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<OrderLabTestView>(
      name: Routes.orderLabTest,
      transitionDuration: transitionDuration,
      page: OrderLabTestView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<PharmacyHomeScreen>(
      name: Routes.pharmacyHome,
      transitionDuration: transitionDuration,
      page: PharmacyHomeScreen.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<PharmacyNotificationView>(
      name: Routes.pharmacyNotification,
      transitionDuration: transitionDuration,
      page: PharmacyNotificationView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<OrderDetailsView>(
      name: Routes.pharmacyOrderDetails,
      transitionDuration: transitionDuration,
      page: OrderDetailsView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<ReceptionistPatientList>(
      name: Routes.receptionistPatientList,
      transitionDuration: transitionDuration,
      page: ReceptionistPatientList.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<DoctorsProfile>(
      name: Routes.doctorsProfile,
      transitionDuration: transitionDuration,
      page: DoctorsProfile.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<SearchDoctorsView>(
      name: Routes.patientSearchDoctors,
      transitionDuration: transitionDuration,
      page: SearchDoctorsView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<AddNewPatient>(
      name: Routes.addNewPatient,
      transitionDuration: transitionDuration,
      page: AddNewPatient.new,
      transition: Transition.rightToLeft,
    ),
  ];
}
