import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class PatientScheduleScreen extends StatelessWidget {
  const PatientScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Patient Scheduling',
      ),
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: CustomButton(
          title: 'Schedule',
          isDisable: false,
          onTap: () {},
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
              CustomTextfield(
                onChange: (value) {},
                hintText: 'MRD Number',
              ),
              const Gap(15),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Patient Name',
              ),
              const Gap(15),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Phone',
              ),
              const Gap(15),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Email',
              ),
              const Gap(15),
              const CustomDropdownField(
                hintText: 'Speciality',
                dropDownList: [
                  DropDownValueModel(name: 'Cardiologist', value: '1'),
                  DropDownValueModel(name: 'Gynacologist', value: '1'),
                  DropDownValueModel(name: 'Neurolgist', value: '1'),
                  DropDownValueModel(name: 'General', value: '1'),
                  DropDownValueModel(name: 'Medicine Specialist', value: '1'),
                  DropDownValueModel(name: 'Dentist', value: '1'),
                ],
              ),
              const Gap(15),
              const CustomDropdownField(
                hintText: 'Doctor',
                dropDownList: [
                  DropDownValueModel(name: 'ArulRaj', value: '1'),
                  DropDownValueModel(name: 'Herold', value: '1'),
                  DropDownValueModel(name: 'Abhisekh', value: '1'),
                  DropDownValueModel(name: 'Sagar', value: '1'),
                  DropDownValueModel(name: 'Hariharan', value: '1'),
                ],
              ),
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
              const Gap(15),
              const CustomDropdownField(
                hintText: 'No. of slots',
                dropDownList: [
                  DropDownValueModel(name: '1', value: '1'),
                  DropDownValueModel(name: '2', value: '1'),
                  DropDownValueModel(name: '3', value: '1'),
                  DropDownValueModel(name: '4', value: '1'),
                  DropDownValueModel(name: '5', value: '1'),
                ],
              ),
              Text(
                'Note : One slot refers to 30 minutes.',
                style: Styles.grey10.copyWith(color: Colors.grey.shade700),
              ),
              const Gap(15),
              Text(
                'Tell us how you found out about us.',
                style: Styles.black12,
              ),
              const Gap(5),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Info Source',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
