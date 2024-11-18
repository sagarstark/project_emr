import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/home/home.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ReceptionistPatientList extends StatelessWidget {
  const ReceptionistPatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'receptionist-patient-list',
      initState: (state) async {
        final controller = Get.find<HomeController>();
        await controller.getPatientList();
      },
      builder: (controller) {
        return GestureDetector(
          onTap: Utility.hideKeyboard,
          child: Scaffold(
            appBar: CustomAppbar(
              title: 'Patient List',
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: Dimens.sixteen),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    onPressed: RouteManagement.goToAddNewPatient,
                    child: Text(
                      '+ Add New',
                      style: Styles.black12,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(16),
                Padding(
                  padding: Dimens.edgeInsets16_0_16_0,
                  child: CustomTextfield(
                    textEditingController:
                        controller.searchPatientTextController,
                    onChange: (value) {},
                    hintText: 'Search Patient By Name',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: ColorsValue.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        icon: const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => controller.getPatientList(
                            controller.searchPatientTextController.text),
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: controller.isPatientListLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade200,
                          child: ListView.separated(
                            itemCount: 5,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => PatientCard(
                              name: '',
                              profilePic: '',
                              mrdNo: '',
                              contact: '',
                              gender: '',
                              nationality: '',
                              onTap: () {},
                            ),
                            separatorBuilder: (context, index) => const Gap(10),
                          ))
                      : controller.patientResponseModel == null ||
                              controller.patientResponseModel!.data.isEmpty
                          ? const Center(
                              child: Text('No Patient Found.'),
                            )
                          : ListView.separated(
                              itemCount:
                                  controller.patientResponseModel!.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => PatientCard(
                                  name:
                                      '${controller.patientResponseModel!.data[index].name}',
                                  profilePic: '',
                                  mrdNo:
                                      '${controller.patientResponseModel!.data[index].mrdNo}',
                                  contact:
                                      '${controller.patientResponseModel!.data[index].phoneNo}',
                                  gender:
                                      '${controller.patientResponseModel!.data[index].gender}',
                                  nationality:
                                      '${controller.patientResponseModel!.data[index].nationality}',
                                  onTap: () {
                                    controller.selectedPatientId = controller
                                        .patientResponseModel!
                                        .data[index]
                                        .patientId;
                                    RouteManagement.goToFilterAvailability();
                                  }),
                              separatorBuilder: (context, index) =>
                                  const Gap(10),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.name,
    required this.profilePic,
    required this.mrdNo,
    required this.contact,
    required this.gender,
    required this.nationality,
    required this.onTap,
  });

  final String name, profilePic, mrdNo, contact, gender, nationality;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: onTap,
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: Dimens.edgeInsets16_0_16_0,
        child: Padding(
          padding: Dimens.edgeInsets10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimens.hundred,
                width: Dimens.hundred,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/images/patient.png'),
              ),
              const Gap(15),
              Expanded(
                child: SizedBox(
                  // height: Dimens.hundred,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name : $name',
                        style: Styles.black14w500,
                      ),
                      Text(
                        'MRD No : $mrdNo',
                        style: Styles.black14,
                      ),
                      // Spacer(),
                      const Gap(10),
                      Text(
                        'Contact : $contact',
                        style: Styles.black12,
                      ),
                      Text(
                        'Gender : $gender',
                        style: Styles.black12,
                      ),
                      Text(
                        'Nationality : $nationality',
                        style: Styles.black12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
