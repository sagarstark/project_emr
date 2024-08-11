import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Edit User Details',
      ),
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: Row(
          children: [
            const Expanded(
              child: CustomButton(
                title: 'Save',
                isDisable: false,
                onTap: RouteManagement.goToAddDependents,
              ),
            ),
            const Gap(10),
            Expanded(
              child: CustomButton(
                title: 'Cancel',
                isDisable: false,
                buttonType: ButtonType.cancelled,
                onTap: () {},
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
                              onPressed: () {}, child: const Text('Upload')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Gap(15),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'National ID',
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'MRD Number',
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Patient Name',
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                isReadOnly: true,
                suffixIcon: const Icon(Icons.calendar_month),
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
                        // controller.availabilityDateController.text =
                        //     DateFormat('dd MMMM yyyy, EEEE')
                        //         .format(selectedDate);
                        // controller.selectedAvailabilityDate = selectedDate;
                        // controller.update();
                      }
                    },
                  );
                },
                hintText: 'Date of Birth',
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Age',
              ),
              const Gap(10),
              const CustomDropdownField(
                hintText: 'Gender',
                dropDownList: [
                  DropDownValueModel(name: 'Male', value: '1'),
                  DropDownValueModel(name: 'Female', value: '1'),
                  DropDownValueModel(name: 'Others', value: '1'),
                ],
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Nationality',
              ),
              const Gap(10),
              const CustomDropdownField(
                hintText: 'Marital Status',
                dropDownList: [
                  DropDownValueModel(name: 'Married', value: '1'),
                  DropDownValueModel(name: 'Single', value: '1'),
                ],
              ),
              const Gap(10),
              const CustomDropdownField(
                hintText: 'Visa Type',
                dropDownList: [
                  DropDownValueModel(name: 'Resident', value: '1'),
                  DropDownValueModel(name: 'Local', value: '1'),
                  DropDownValueModel(name: 'Visitor', value: '1'),
                ],
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Other ID',
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Occupation',
              ),
              const Gap(10),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Address',
              ),
              const Gap(10),
              Text(
                'Payment Type',
                style: Styles.black14,
              ),
              const Gap(10),
              RadioListTile(
                value: 'value',
                groupValue: 'groupValue',
                title: const Text('Cash'),
                contentPadding: Dimens.edgeInsets0_4,
                visualDensity: const VisualDensity(vertical: -4),
                onChanged: (value) {},
              ),
              RadioListTile(
                value: 'value',
                groupValue: 'groupValue',
                contentPadding: Dimens.edgeInsets0_4,
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('Card'),
                onChanged: (value) {},
              ),
              RadioListTile(
                value: 'value',
                groupValue: 'groupValue',
                contentPadding: Dimens.edgeInsets0_4,
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('Insurance'),
                onChanged: (value) {},
              ),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}
