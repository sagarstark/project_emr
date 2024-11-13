import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class AddNewPatient extends StatelessWidget {
  const AddNewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Add New Patient',
      ),
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16,
        child: CustomButton(
          title: 'Save',
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              hintText: 'Patient Name',
              onChange: (value) {},
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Date of Birth',
              onChange: (value) {
                // Handle age change
              },
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Gender',
              onChange: (value) {
                // Handle contact number change
              },
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Phone Number',
              onChange: (value) {
                // Handle contact number change
              },
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Email ID',
              onChange: (value) {
                // Handle contact number change
              },
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Address',
              onChange: (value) {
                // Handle contact number change
              },
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Problem',
              onChange: (value) {
                // Handle contact number change
              },
            ),
            const Gap(16),
            CustomTextfield(
              hintText: 'Symptoms',
              onChange: (value) {
                // Handle contact number change
              },
            ),
          ],
        ),
      ),
    );
  }
}
