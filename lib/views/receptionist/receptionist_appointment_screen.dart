import 'package:flutter/material.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/navigators/navigators.dart';
import 'package:project_emr/widgets/widgets.dart';

class ReseptionistAppointmentScreen extends StatelessWidget {
  const ReseptionistAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: Dimens.ten),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
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
          branchName: 'Facility Scheduling',
          ontap: () {},
        ),
        AppointmentItem(
          branchName: 'Facility Schedule List',
          ontap: () {},
        ),
        AppointmentItem(
          branchName: 'Schedule Followup',
          ontap: () {},
        ),
        AppointmentItem(
          branchName: 'Vaccination Schedules',
          ontap: () {},
        ),
      ],
    );
  }
}
