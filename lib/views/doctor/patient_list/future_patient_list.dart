import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';

class FuturePatientListView extends StatelessWidget {
  const FuturePatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'future-patient-list',
      initState: (state) async {
        final controller = Get.find<HomeController>();
        await controller.getPatientsByDoctorsId(
            filters: 'future', updateId: 'future-patient-list');
      },
      builder: (controller) {
        return controller.isDoctorsPatientList
            ? const CustomLoader()
            : controller.doctorsPatientListModel == null ||
                    controller.doctorsPatientListModel!.data!.isEmpty
                ? const Center(
                    child: Text('No Patients Available.'),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        controller.doctorsPatientListModel?.data?.length ?? 0,
                    separatorBuilder: (context, index) => const Gap(12),
                    itemBuilder: (context, index) => PatientCardInDoctorsList(
                      name: controller.doctorsPatientListModel?.data?[index]
                              .patientName ??
                          'N/A',
                      problem: controller
                              .doctorsPatientListModel?.data?[index].problem ??
                          'No diagnosis',
                      time: controller.doctorsPatientListModel?.data?[index]
                              .appointmentTime ??
                          'N/A',
                      location: controller
                              .doctorsPatientListModel?.data?[index].location ??
                          'N/A',
                      imageAsset: 'assets/images/patient.png',
                      onPressed: RouteManagement.goToPatientDetails,
                    ),
                  );
      },
    );
  }
}
