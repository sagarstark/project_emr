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
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Check Availability',
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets16,
            child: CustomButton(
              title: 'Apply',
              isDisable: false,
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
                  const Text('Select a date from the calender :'),
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
                  const Text('Select one branch to search :'),
                  const Gap(15),
                  const CustomDropdownField(
                    hintText: 'Branch',
                    dropDownList: [
                      DropDownValueModel(name: 'Bengaluru', value: '1'),
                      DropDownValueModel(name: 'Chennai', value: '1'),
                      DropDownValueModel(name: 'Pune', value: '1'),
                      DropDownValueModel(name: 'Hyderabad', value: '1'),
                      DropDownValueModel(name: 'Delhi', value: '1'),
                    ],
                  ),
                  const Gap(20),
                  const Text('Select one speciality from below :'),
                  const Gap(10),
                  Wrap(
                    runSpacing: 5,
                    spacing: 8,
                    children: List.generate(
                      controller.specialList.length,
                      (index) {
                        return RawChip(
                          label: Text(controller.specialList[index]),
                          labelStyle: controller.selectedSpecialList
                                  .contains(controller.specialList[index])
                              ? Styles.white12w500
                              : Styles.black12,
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.fifty),
                          ),
                          selected: controller.selectedSpecialList
                              .contains(controller.specialList[index]),
                          selectedColor: ColorsValue.primaryColor,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            controller.selectedSpecialList.clear();
                            if (controller.selectedSpecialList
                                .contains(controller.specialList[index])) {
                              controller.selectedSpecialList
                                  .remove(controller.specialList[index]);
                            } else {
                              controller.selectedSpecialList
                                  .add(controller.specialList[index]);
                            }
                            controller.update(['filter-availability']);
                          },
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  const Text(
                      'Who would you like to choose as your doctor from the following list :'),
                  const Gap(15),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.eight),
                      child: const Column(
                        children: [
                          CustomRadioTile(
                            name: 'Dr. Sagar K',
                            experience: '7',
                          ),
                          const Gap(10),
                          CustomRadioTile(
                            name: 'Dr. Abhisek',
                            experience: '5',
                          ),
                          const Gap(10),
                          CustomRadioTile(
                            name: 'Dr. Herold',
                            experience: '3',
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
      },
    );
  }
}

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.name,
    required this.experience,
  });

  final String name;
  final String experience;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: ColorsValue.secondaryColor,
          child: Icon(Icons.person),
          radius: 30.0,
        ),
        Expanded(
          child: RadioListTile(
            value: 'value',
            groupValue: 'groupValue',
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
