import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/navigators/navigators.dart';
import 'package:project_emr/widgets/widgets.dart';

class ReceptionistAppointmentScreen extends StatelessWidget {
  const ReceptionistAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: Dimens.edgeInsets16,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.5,
      children: [
        const AppointmentItem(
          branchName: 'Patient Scheduling',
          ontap: RouteManagement.goToReceptionistPatientList,
        ),
        AppointmentItem(
          branchName: 'Patient Schedule List',
          ontap: () {},
        ),
        AppointmentItem(
          branchName: 'Schedule Followup',
          ontap: () {},
        ),
      ],
    );
  }
}
