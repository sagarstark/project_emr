import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class AddNewPatient extends StatelessWidget {
  AddNewPatient({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'add-new-patient',
      initState: (state) {
        controller.clearAllFields();
      },
      builder: (controller) {
        return GestureDetector(
          onTap: Utility.hideKeyboard,
          child: Scaffold(
            appBar: const CustomAppbar(
              title: 'Add New Patient',
            ),
            bottomNavigationBar: Padding(
              padding: Dimens.edgeInsets16,
              child: CustomButton(
                isDisable: !controller.isValidForm(),
                title: 'Continue',
                onTap: controller.createPatient,
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please fill all the details to proceed further.',
                    style: Styles.black14,
                  ),
                  const Gap(10),
                  CustomTextfield(
                    textEditingController: controller.nameController,
                    hintText: 'Patient Name',
                    onChange: (value) {
                      controller.update(['add-new-patient']); // Add update call
                    },
                  ),
                  const Gap(16),
                  CustomTextfield(
                    textEditingController: controller.dobController,
                    onChange: (value) {},
                    isReadOnly: true,
                    suffixIcon: const Icon(
                      Icons.calendar_month_rounded,
                      color: ColorsValue.secondaryColor,
                    ),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          firstDate: DateTime(1800),
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
                            controller.dobController.text =
                                DateFormat('dd MMMM yyyy').format(selectedDate);
                            controller.newPatientDOB = selectedDate;
                            controller.update();
                          }
                        },
                      );
                    },
                    hintText: 'Date Of Birth',
                  ),
                  const Gap(16),
                  CustomDropdownField(
                    onChanged: (val) {
                      if (val != null && val is DropDownValueModel) {
                        controller.genderController.text = val.value;
                      }
                      controller.update(['add-new-patient']);
                    },
                    hintText: 'Gender',
                    dropDownList: const [
                      DropDownValueModel(name: 'Male', value: 'Male'),
                      DropDownValueModel(name: 'Female', value: 'Female'),
                      DropDownValueModel(name: 'Others', value: 'Others'),
                    ],
                  ),
                  const Gap(16),
                  CustomTextfield(
                    textEditingController: controller.phoneController,
                    hintText: 'Phone Number',
                    textInputType: TextInputType.phone,
                    onChange: (value) {
                      // Handle contact number change
                      controller.update(['add-new-patient']);
                    },
                  ),
                  const Gap(16),
                  CustomTextfield(
                    textEditingController: controller.emailController,
                    hintText: 'Email ID',
                    textInputType: TextInputType.emailAddress,
                    onChange: (value) {
                      // Handle contact number change
                      controller.update(['add-new-patient']);
                    },
                  ),
                  const Gap(16),
                  CustomTextfield(
                    textEditingController: controller.addressController,
                    hintText: 'Address',
                    onChange: (value) {
                      // Handle contact number change
                      controller.update(['add-new-patient']);
                    },
                  ),
                  const Gap(16),
                  CustomTextfield(
                    textEditingController: controller.problemController,
                    hintText: 'Problem',
                    onChange: (value) {
                      // Handle contact number change
                      controller.update(['add-new-patient']);
                    },
                  ),
                  const Gap(16),
                  CustomTextfield(
                    textEditingController: controller.symptomsController,
                    hintText: 'Symptoms',
                    onChange: (value) {
                      // Handle contact number change
                      controller.update(['add-new-patient']);
                    },
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
