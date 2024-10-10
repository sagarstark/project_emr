import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class PatientBookAppointmentView extends StatelessWidget {
  const PatientBookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Book An Appointment',
      ),
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                title: 'Save',
                isDisable: false,
                onTap: () {},
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
              Text(
                'Appointment Type',
                style: Styles.black14,
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: 'value',
                      groupValue: 'groupValue',
                      title: const Text('General'),
                      contentPadding: Dimens.edgeInsets0_4,
                      visualDensity: const VisualDensity(vertical: -4),
                      onChanged: (value) {},
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 'value',
                      groupValue: 'groupValue',
                      contentPadding: Dimens.edgeInsets0_4,
                      visualDensity: const VisualDensity(vertical: -4),
                      title: const Text('Urgent'),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const Gap(15),
              CustomDropdownField(
                onChanged: (p0) {},
                hintText: 'Location',
                dropDownList: const [
                  DropDownValueModel(name: 'Delhui', value: '1'),
                  DropDownValueModel(name: 'Mumbai', value: '1'),
                  DropDownValueModel(name: 'Pune', value: '1'),
                  DropDownValueModel(name: 'Bengaluru', value: '1'),
                  DropDownValueModel(name: 'Channai', value: '1'),
                ],
              ),
              const Gap(15),
              CustomDropdownField(
                onChanged: (p0) {},
                hintText: 'Speciality',
                dropDownList: const [
                  DropDownValueModel(name: 'Cardiologist', value: '1'),
                  DropDownValueModel(name: 'Gynacologist', value: '1'),
                  DropDownValueModel(name: 'Neurolgist', value: '1'),
                  DropDownValueModel(name: 'General', value: '1'),
                  DropDownValueModel(name: 'Medicine Specialist', value: '1'),
                  DropDownValueModel(name: 'Dentist', value: '1'),
                ],
              ),
              const Gap(15),
              CustomDropdownField(
                onChanged: (p0) {},
                hintText: 'Provider',
                dropDownList: const [
                  // DropDownValueModel(name: 'Cardiologist', value: '1'),
                  // DropDownValueModel(name: 'Gynacologist', value: '1'),
                  // DropDownValueModel(name: 'Neurolgist', value: '1'),
                  // DropDownValueModel(name: 'General', value: '1'),
                  // DropDownValueModel(name: 'Medicine Specialist', value: '1'),
                  // DropDownValueModel(name: 'Dentist', value: '1'),
                ],
              ),
              const Gap(15),
              Text(
                'Select the Date and Time',
                style: Styles.black14,
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
                hintText: 'Date',
              ),
              const Gap(10),
              CustomDropdownField(
                onChanged: (p0) {},
                hintText: 'Time',
                dropDownList: const [
                  DropDownValueModel(name: '09:00 AM - 09:15 AM', value: '1'),
                  DropDownValueModel(name: '09:00 AM - 09:15 AM', value: '1'),
                  DropDownValueModel(name: '09:00 AM - 09:15 AM', value: '1'),
                  DropDownValueModel(name: '09:00 AM - 09:15 AM', value: '1'),
                  DropDownValueModel(name: '09:00 AM - 09:15 AM', value: '1'),
                  DropDownValueModel(name: '09:00 AM - 09:15 AM', value: '1'),
                ],
              ),
              const Gap(15),
              Text(
                'Type',
                style: Styles.black14,
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: 'value',
                      groupValue: 'groupValue',
                      title: const Text('Audio'),
                      contentPadding: Dimens.edgeInsets0_4,
                      visualDensity: const VisualDensity(vertical: -4),
                      onChanged: (value) {},
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: 'value',
                      groupValue: 'groupValue',
                      contentPadding: Dimens.edgeInsets0_4,
                      visualDensity: const VisualDensity(vertical: -4),
                      title: const Text('Video'),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const Gap(15),
              CustomTextfield(
                onChange: (value) {},
                hintText: 'Reason',
              ),
              const Gap(15),
              Row(
                children: [
                  Text(
                    'Attachments',
                    style: Styles.black14,
                  ),
                  const Spacer(),
                  Container(
                    width: Get.width / 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Upload'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
