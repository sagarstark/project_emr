/// This class is used for all the APIs endpoints
class Apis {
  const Apis._();

  static const String baseUrl =
      'http://ec2-16-170-201-240.eu-north-1.compute.amazonaws.com:8080/';

  /// Auth APIs---------------------------------------------------------------------------------------
  static const String signIn = 'app/auth/signin';
  static const String forgotPassword = 'app/auth/forgotpassword';
  static const String resetPassword = 'app/auth/resetpassword';

  /// Receptionist Flow APIs---------------------------------------------------------------------------------------
  static const String getAllBranches = 'app/admin/getAllBranches';
  static const String getPatientList = 'app/patient/searchPatients';
  static const String createNewPatient = 'app/patient/createNewPatient';
  static const String getAllSpecialities = 'app/doctor/getAllSpecialities';
  static const String getAvailableDoctor = 'app/doctor/getAvailableDoctor';
  static const String getDoctorAvailableSlots = 'app/doctor/MobAvailableSlots';
  static const String receptionistBookAppointment =
      'app/doctorappointment/mobBookAppointment';

  /// Doctor's Flow APIs---------------------------------------------------------------------------------------
  static const String getDoctorsAppointment =
      'app/doctorappointment/getAppointsByDocWithFilters';
  static const String getPatientsByDoctorsId =
      'app/patient/getPatientsByDocIdWithFilters';

  ///  APIs---------------------------------------------------------------------------------------
  static const String getDoctorSchedule = 'app/admin/getDoctorSchedule';
  static const String getAllAppointment =
      'app/doctorappointment/getAllAppointment';
  static const String getAppointmentsByDoctorID =
      'app/doctorappointment/getAppointmentsByDoctorID';
  static const String rescheduleAppointment =
      'app/doctorappointment/rescheduleAppointment';
  static const String cancelAppointment =
      'app/doctorappointment/cancelAppointment';
  static const String getAllDoctors = 'app/doctor/getAllDoctors';
  static const String getDoctorById = 'app/doctor/getDoctorById';
  static const String getDoctorsByBranch = 'app/doctor/getDoctorsByBranch';
}
