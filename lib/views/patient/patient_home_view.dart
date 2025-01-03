import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/views/patient/video_call.dart';
import 'package:project_emr/widgets/widgets.dart';

class PatientHomeView extends StatelessWidget {
  PatientHomeView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbar(
        title: 'Hi! Kevin',
        autoImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu_open_rounded,
            size: Dimens.twentyFive,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Material(
        borderRadius:
            BorderRadius.horizontal(right: Radius.circular(Dimens.fifteen)),
        child: SizedBox(
          width: Get.width * 0.75,
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorsValue.primaryColor,
                      Colors.blueAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Kevin (Patient)',
                    style: Styles.white16w500,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: Get.back,
              ),
              ListTile(
                leading: const Icon(Icons.phone_callback_rounded),
                title: const Text('Audio Call'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: Get.back,
              ),
              ListTile(
                leading: const Icon(Icons.video_call_rounded),
                title: const Text('Video Call'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  Get.back();
                  Get.offAll(() => const VideoCallScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.directions_walk_rounded),
                title: const Text('Clinical Appointment'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: Get.back,
              ),
              const ListTile(
                leading: Icon(Icons.power_settings_new_rounded),
                title: Text('Logout'),
                trailing: Icon(Icons.chevron_right_rounded),
                onTap: RouteManagement.goToLogIn,
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(Dimens.sixteen),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
        children: [
          const AppointmentItem(
            branchName: 'Book Appointment',
            ontap: RouteManagement.goToPatientBookAppointment,
          ),
          AppointmentItem(
            branchName: 'Appointment History',
            ontap: () {},
          ),
          AppointmentItem(
            branchName: 'Cancel Appointment',
            ontap: () {},
          ),
          const AppointmentItem(
            branchName: 'Search Doctors',
            ontap: RouteManagement.goToPatientSearchDoctors,
          ),
        ],
      ),
    );
  }
}
