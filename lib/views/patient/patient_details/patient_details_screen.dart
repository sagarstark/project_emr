import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return GetBuilder<HomeController>(
      initState: (state) {
        controller.clearPatientFields();
      },
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Edit User Details',
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets16,
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Save',
                    isDisable: false,
                    // onTap: () => controller.patientRegistration(),
                    onTap: RouteManagement.goToUploadDocuments,
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: CustomButton(
                    title: 'Cancel',
                    isDisable: false,
                    buttonType: ButtonType.cancelled,
                    onTap: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please fillup all the details mentioned below.',
                    style: Styles.black14,
                  ),
                  const Gap(15),
                  Container(
                    height: Dimens.hundred,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: Dimens.sixty,
                          backgroundColor: ColorsValue.secondaryColor,
                          child: Icon(
                            Icons.person,
                            size: Dimens.forty,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Please upload a profile picture.'),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsValue.secondaryColor,
                                ),
                                child: Text(
                                  'Upload',
                                  style: Styles.white14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController:
                        controller.patientNationalIdController,
                    onChange: (value) {},
                    hintText: 'National ID',
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController: controller.patientNameController,
                    onChange: (value) {},
                    hintText: 'Patient Name',
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController: controller.patientDobController,
                    onChange: (value) {},
                    isReadOnly: true,
                    suffixIcon: const Icon(Icons.calendar_month),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, picker) {
                          return Theme(
                            data: ThemeData().copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: ColorsValue.primaryColor,
                              ),
                            ),
                            child: picker!,
                          );
                        },
                      ).then(
                        (selectedDate) {
                          if (selectedDate != null) {
                            controller.newPatientDOB = selectedDate;
                            controller.patientDobController.text =
                                DateFormat('dd MMMM yyyy').format(selectedDate);
                            controller.update();
                          }
                        },
                      );
                    },
                    hintText: 'Date of Birth',
                  ),
                  const Gap(15),
                  CustomDropdownField(
                    onChanged: (value) {
                      if (value != null) {
                        controller.genderController.text = value.name;
                      }
                    },
                    hintText: 'Gender',
                    dropDownList: const [
                      DropDownValueModel(name: 'Male', value: 'Male'),
                      DropDownValueModel(name: 'Female', value: 'Female'),
                      DropDownValueModel(name: 'Others', value: 'Others'),
                    ],
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController:
                        controller.patientNationalityController,
                    onChange: (value) {},
                    hintText: 'Nationality',
                  ),
                  const Gap(15),
                  CustomDropdownField(
                    onChanged: (value) {
                      if (value != null) {
                        controller.patientMaritalStatusController.text =
                            value.name;
                      }
                    },
                    hintText: 'Marital Status',
                    dropDownList: const [
                      DropDownValueModel(name: 'Married', value: 'Married'),
                      DropDownValueModel(name: 'Single', value: 'Single'),
                    ],
                  ),
                  const Gap(15),
                  CustomDropdownField(
                    onChanged: (value) {
                      if (value != null) {
                        controller.patientVisaTypeController.text = value.name;
                      }
                    },
                    hintText: 'Visa Type',
                    dropDownList: const [
                      DropDownValueModel(name: 'Resident', value: 'Resident'),
                      DropDownValueModel(name: 'Local', value: 'Local'),
                      DropDownValueModel(name: 'Visitor', value: 'Visitor'),
                    ],
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController: controller.patientOtherIdController,
                    onChange: (value) {},
                    hintText: 'Other ID',
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController:
                        controller.patientOccupationController,
                    onChange: (value) {},
                    hintText: 'Occupation',
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController: controller.patientAddressController,
                    onChange: (value) {},
                    hintText: 'Address',
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController: controller.patientPhoneController,
                    onChange: (value) {},
                    hintText: 'Phone Number',
                    textInputType: TextInputType.phone,
                  ),
                  const Gap(15),
                  CustomTextfield(
                    textEditingController: controller.patientEmailController,
                    onChange: (value) {},
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
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
