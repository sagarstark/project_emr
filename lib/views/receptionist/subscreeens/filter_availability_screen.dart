import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class FilterAvailabilityScreen extends StatelessWidget {
  const FilterAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'filter-availability',
      initState: (state) {
        final controller = Get.find<HomeController>();
        controller.showAvailableDoctorsList = false;
        controller.availabilityDateController.clear();
        controller.selectedBranchId = '';
        controller.selectedSpeciality = '';
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
              title: 'Apply',
              isDisable: true,
              onTap: () {
                controller.finalSelectedAvailabilityDate =
                    controller.selectedAvailabilityDate;
                RouteManagement.goToCheckAvailability();
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
                  Wrap(
                    runSpacing: 5,
                    spacing: 8,
                    children: controller.isSpecializationLoading
                        ? List.generate(
                            6,
                            (index) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey.shade600,
                                  child: RawChip(
                                    label: const Text('Shimmer'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.fifty),
                                    ),
                                  ));
                            },
                          )
                        : List.generate(
                            controller.allSpecialistRes!.data!.length,
                            (index) {
                              return RawChip(
                                label: Text(
                                    '${controller.allSpecialistRes?.data?[index].name}'),
                                labelStyle: controller.selectedSpeciality ==
                                        '${controller.allSpecialistRes?.data?[index].specialityId}'
                                    ? Styles.white12w500
                                    : Styles.black12,
                                showCheckmark: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.fifty),
                                ),
                                selected: controller.selectedSpeciality ==
                                    '${controller.allSpecialistRes!.data?[index].specialityId}',
                                selectedColor: ColorsValue.primaryColor,
                                backgroundColor: controller
                                            .selectedSpeciality ==
                                        '${controller.allSpecialistRes?.data?[index].specialityId}'
                                    ? ColorsValue.primaryColor
                                    : Colors.white,
                                onPressed: () {
                                  controller.selectedSpeciality =
                                      '${controller.allSpecialistRes?.data?[index].specialityId}';
                                  controller.update(['filter-availability']);
                                },
                              );
                            },
                          ),
                  ),
                  const Gap(10),
                  ElevatedButton(
                    onPressed: () async {
                      if (controller.availabilityDateController.text.isEmpty ||
                          controller.selectedBranchId.isEmpty ||
                          controller.selectedSpeciality.isEmpty) {
                        Utility.showMessage(
                            message:
                                'Please select all the three fields to find the appropriate Doctor for yourself.',
                            type: MessageType.error);
                      } else {
                        controller.getAvailableDoctor();
                      }
                    },
                    child: SizedBox(
                      width: Get.width,
                      child: const Center(
                        child: Text('Search for Doctors'),
                      ),
                    ),
                  ),
                  const Gap(10),
                  const Divider(),
                  const Gap(20),
                  if (controller.showAvailableDoctorsList &&
                      controller.filterDoctorModel != null) ...[
                    const RequiredText(
                        text:
                            'Who would you like to choose as your doctor from the following list :'),
                    const Gap(15),
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.all(Dimens.eight),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.filterDoctorModel!.data!.length,
                          itemBuilder: (context, index) => CustomRadioTile(
                            name:
                                '${controller.filterDoctorModel?.data?[index].doctor?.name}',
                            experience:
                                '${controller.filterDoctorModel?.data?[index].doctor?.experience}',
                            value: '',
                            groupValue: '',
                          ),
                          separatorBuilder: (context, index) => const Gap(10),
                        ),
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

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.name,
    required this.experience,
    required this.value,
    required this.groupValue,
  });

  final String name;
  final String experience;
  final String value;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          backgroundColor: ColorsValue.secondaryColor,
          radius: 30.0,
          child: Icon(Icons.medication_rounded),
        ),
        Expanded(
          child: RadioListTile(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {},
            contentPadding: const EdgeInsets.only(left: 10),
            title: Text(
              name,
              style: Styles.black14w500,
            ),
            subtitle: Text(
              'Experience - $experience Yrs',
              style: Styles.grey12,
            ),
            activeColor: ColorsValue.purpleColor,
            controlAffinity: ListTileControlAffinity.trailing,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            visualDensity: const VisualDensity(vertical: -4),
          ),
        ),
      ],
    );
  }
}
