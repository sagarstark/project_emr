import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class FilterAvailabilityScreen extends StatelessWidget {
  const FilterAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'filter-availability',
      initState: (state) {
        final controller = Get.find<HomeController>();
        controller.showAvailableDoctorsList = false;
        controller.availabilityDateController.text = '';
        controller.selectedBranchId = '';
        controller.selectedSpecialityId = '';
        controller.selectedDoctorIndex = null;
        controller.getAllSpecialities();
      },
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Check Availability',
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets16,
            child: CustomButton(
              title: 'Check',
              isDisable: controller.selectedDoctorIndex == null,
              onTap: () {
                controller.finalSelectedAvailabilityDate =
                    controller.selectedAvailabilityDate;
                RouteManagement.goToCheckAvailability(
                  doctorId:
                      '${controller.filterDoctorModel?.data?[controller.selectedDoctorIndex!].doctor?.doctorId}',
                  doctorName:
                      '${controller.filterDoctorModel?.data?[controller.selectedDoctorIndex!].doctor?.name}',
                  contactInfo:
                      '${controller.filterDoctorModel?.data?[controller.selectedDoctorIndex!].doctor?.contactInfo}',
                  branch:
                      '${controller.filterDoctorModel?.data?[controller.selectedDoctorIndex!].doctor?.branchMaster?.branchName}',
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Check availability of doctors before scheduling your appointment.',
                    style: Styles.black14,
                  ),
                  const Gap(15),
                  const RequiredText(text: 'Select a date from the calender :'),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController:
                        controller.availabilityDateController,
                    onChange: (value) {},
                    isReadOnly: true,
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(3000),
                          builder: (context, picker) {
                            return Theme(
                              data: ThemeData().copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: ColorsValue.primaryColor,
                                ),
                              ),
                              child: picker!,
                            );
                          }).then(
                        (selectedDate) {
                          if (selectedDate != null) {
                            controller.availabilityDateController.text =
                                DateFormat('dd MMMM yyyy, EEEE')
                                    .format(selectedDate);
                            controller.selectedAvailabilityDate = selectedDate;
                            controller.validateAvailability();
                            controller.update();
                          }
                        },
                      );
                    },
                    hintText: 'Date',
                  ),
                  const Gap(20),
                  const RequiredText(text: 'Select one branch to search :'),
                  const Gap(15),
                  CustomDropdownField(
                    onChanged: (val) {
                      if (val != null && val is DropDownValueModel) {
                        controller.selectedBranchId = val.value;
                        AppLog(controller.selectedBranchId);
                      }
                      if (val == null || val == '') {
                        controller.selectedBranchId = '';
                      }
                      controller.validateAvailability();
                    },
                    hintText: 'Branch',
                    dropDownList: controller.allBranchRes?.data?.map((branch) {
                          return DropDownValueModel(
                            name: branch.branchName?.capitalizeFirst ?? '',
                            value: branch.branchId?.toString() ?? '',
                          );
                        }).toList() ??
                        [],
                  ),
                  const Gap(20),
                  const RequiredText(
                      text: 'Select one speciality from below :'),
                  const Gap(10),
                  CustomDropdownField(
                    onChanged: (val) {
                      if (val != null && val is DropDownValueModel) {
                        controller.selectedSpecialityId = val.value;
                        AppLog(controller.selectedSpecialityId);
                      }
                      if (val == null || val == '') {
                        controller.selectedSpecialityId = '';
                      }
                      controller.validateAvailability();
                    },
                    hintText: 'Speciality',
                    dropDownList: controller.allSpecialistRes?.data
                            ?.map((speciality) {
                          return DropDownValueModel(
                            name: speciality.name?.capitalizeFirst ?? '',
                            value: speciality.specialityId?.toString() ?? '',
                          );
                        }).toList() ??
                        [],
                  ),
                  const Gap(10),
                  const Gap(10),
                  if (controller.showAvailableDoctorsList &&
                      controller.filterDoctorModel != null) ...[
                    const Divider(),
                    const Gap(20),
                    const RequiredText(
                        text:
                            'Who would you like to choose as your doctor from the following list :'),
                    const Gap(15),
                    Padding(
                      padding: EdgeInsets.all(Dimens.eight),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.filterDoctorModel!.data!.length,
                        itemBuilder: (context, index) => DoctorsTile(
                          name:
                              '${controller.filterDoctorModel?.data?[index].doctor?.name}',
                          experience:
                              '${controller.filterDoctorModel?.data?[index].doctor?.experience}',
                          onTapProfilePic: null,
                          onTap: () {
                            controller.selectDoctor(index);
                            controller.selectedDocId = controller
                                .filterDoctorModel
                                ?.data?[index]
                                .doctor
                                ?.doctorId;
                          },
                          isSelected: controller.selectedDoctorIndex == index,
                        ),
                        separatorBuilder: (context, index) => const Gap(15),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
