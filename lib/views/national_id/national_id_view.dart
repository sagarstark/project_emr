import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class NationalIdView extends StatelessWidget {
  const NationalIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Hi! Kevin',
        autoImplyLeading: false,
        titleSpacing: Dimens.sixteen,
      ),
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 2,
            ),
            Text(
              'Please submit your National ID',
              style: Styles.black16,
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'National ID',
            ),
            const Gap(15),
            const CustomButton(
              title: 'Continue',
              onTap: RouteManagement.goToPatientDetailsForm,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
