import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/navigators/navigators.dart';
import 'package:project_emr/widgets/widgets.dart';

class DoctorsHomeScreen extends StatelessWidget {
  DoctorsHomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbar(
        title: 'Hello! Doctor',
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
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Alerts',
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            icon: const Icon(
              Icons.notifications_active_rounded,
              color: ColorsValue.primaryColor,
            ),
          ),
          const Gap(16),
        ],
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
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF015D67), ColorsValue.primaryColor],
                  ),
                  color: ColorsValue.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Dimens.thirty,
                        child: const Icon(Icons.person_rounded),
                      ),
                      const Gap(15),
                      Text(
                        'Kevin (Doctor)',
                        style: Styles.white16w500,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                trailing: const Icon(Icons.chevron_right_rounded),
                title: const Text('Home'),
                onTap: Get.back,
              ),
              const ListTile(
                leading: Icon(Icons.change_circle_outlined),
                trailing: Icon(Icons.chevron_right_rounded),
                title: Text('Switch Branch'),
                onTap: RouteManagement.goToSelectBranch,
              ),
              const ListTile(
                leading: Icon(Icons.power_settings_new_rounded),
                trailing: Icon(Icons.chevron_right_rounded),
                title: Text('Logout'),
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
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1.5,
        children: [
          const AppointmentItem(
            branchName: 'Appointments',
            ontap: RouteManagement.goToDoctorsAppointment,
          ),
          const AppointmentItem(
            branchName: 'Patient List',
            ontap: RouteManagement.goToPatientList,
          ),
          AppointmentItem(
            branchName: 'Revenue Info',
            ontap: () {},
          ),
          AppointmentItem(
            branchName: 'Reports',
            ontap: () {},
          ),
          AppointmentItem(
            branchName: 'Prescriptions',
            ontap: () {},
          ),
          AppointmentItem(
            branchName: 'Lab Reports',
            ontap: () {},
          ),
          AppointmentItem(
            branchName: 'My Attachments',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
