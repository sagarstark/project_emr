import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'reports-list',
      initState: (state) async {
        final controller = Get.find<HomeController>();
        await controller.getPatientsByDoctorsId(
            filters: 'past', updateId: 'reports-list');
      },
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Reports',
          ),
          body: controller.isDoctorsPatientList
              ? const CustomLoader()
              : controller.doctorsPatientListModel == null ||
                      controller.doctorsPatientListModel!.data!.isEmpty
                  ? const Center(
                      child: Text('No Patients Available.'),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: Dimens.edgeInsets16,
                          child: CustomTextfield(
                            onChange: (value) {},
                            hintText: 'Search by Patient\'s Name',
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller
                                    .doctorsPatientListModel?.data?.length ??
                                0,
                            separatorBuilder: (context, index) => const Gap(12),
                            itemBuilder: (context, index) => Card(
                              margin: Dimens.edgeInsets16_0_16_0,
                              color: Colors.white,
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.4),
                                  borderRadius:
                                      BorderRadius.circular(Dimens.ten),
                                ),
                                child: Padding(
                                  padding: Dimens.edgeInsets10,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Dimens.fifty,
                                        width: Dimens.fifty,
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                            'assets/images/patient.png'),
                                      ),
                                      const Gap(15),
                                      Expanded(
                                        child: Text(
                                          'Name : ${controller.doctorsPatientListModel?.data?[index].patientName ?? 'N/A'}',
                                          style: Styles.black14w500,
                                        ),
                                      ),
                                      const Gap(5),
                                      ElevatedButton(
                                        onPressed: () {
                                          RouteManagement.goToReportsPdfList();
                                        },
                                        child: Text(
                                          'View',
                                          style: Styles.black14w500.copyWith(
                                              color:
                                                  ColorsValue.secondaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            //     PatientCardInDoctorsList(
                            //   name: controller.doctorsPatientListModel
                            //           ?.data?[index].patientName ??
                            //       'N/A',
                            //   problem: controller.doctorsPatientListModel
                            //           ?.data?[index].problem ??
                            //       'No diagnosis',
                            //   time: controller.doctorsPatientListModel
                            //           ?.data?[index].appointmentTime ??
                            //       'N/A',
                            //   location: controller.doctorsPatientListModel
                            //           ?.data?[index].location ??
                            //       'N/A',
                            //   imageAsset: 'assets/images/patient.png',
                            //   onPressed:
                            //       RouteManagement.goToPrescriptionPdfList,
                            // ),
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}