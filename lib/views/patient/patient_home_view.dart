import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
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
                  color: ColorsValue.primaryColor,
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
                trailing: Icon(Icons.chevron_right_rounded),
                onTap: Get.back,
              ),
              ListTile(
                leading: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.blue,
                ),
                title: const Text('Flipkart'),
                trailing: Icon(Icons.chevron_right_rounded),
                onTap: () {
                  Get.to(() => CustomWebView(
                        appBarTitle: 'Flipkart',
                        url: 'https://www.flipkart.com/',
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.ondemand_video_rounded,
                  color: Colors.red,
                ),
                title: const Text('Youtube'),
                trailing: Icon(Icons.chevron_right_rounded),
                onTap: () {
                  Get.to(() => CustomWebView(
                        appBarTitle: 'Youtube',
                        url: 'https://www.youtube.com/',
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone_callback_rounded),
                title: const Text('Audio Call'),
                trailing: Icon(Icons.chevron_right_rounded),
                onTap: Get.back,
              ),
              ListTile(
                leading: const Icon(Icons.video_call_rounded),
                title: const Text('Video Call'),
                trailing: Icon(Icons.chevron_right_rounded),
                onTap: Get.back,
              ),
              ListTile(
                leading: const Icon(Icons.directions_walk_rounded),
                title: const Text('Clinical Appointment'),
                trailing: Icon(Icons.chevron_right_rounded),
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
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1.5,
        children: [
          const AppointmentItem(
            branchName: 'Book Appointment',
            ontap: RouteManagement.goToPatientBookAppointment,
          ),
          AppointmentItem(
            branchName: 'Cancel Appointment',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
