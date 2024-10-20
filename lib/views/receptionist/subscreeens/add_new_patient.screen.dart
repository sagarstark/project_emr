import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class AddNewPatient extends StatelessWidget {
  const AddNewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Add New Patient',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              hintText: 'Patient Name',
              onChange: (value) {
                // Handle name change
              },
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              hintText: 'Age',
              onChange: (value) {
                // Handle age change
              },
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              hintText: 'Contact Number',
              onChange: (value) {
                // Handle contact number change
              },
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              hintText: 'Address',
              onChange: (value) {
                // Handle address change
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle save patient information
              },
              child: Text('Save Patient Information'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
