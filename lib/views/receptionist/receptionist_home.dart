import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/home/home.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';

class ReceptionistHomeScreen extends StatelessWidget {
  ReceptionistHomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(Dimens.fifteen),
            ),
            child: SizedBox(
              width: Get.width * 0.75,
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorsValue.primaryColor,
                          Colors.blueAccent,
                        ],
                      ),
                      // color: ColorsValue.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Kevin (Receptionist)',
                        style: Styles.white16w500,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    title: const Text('Home'),
                    onTap: () {
                      AppLog.info(Get.find<HomeController>().allBranchRes);
                    },
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
          body: ReceptionistAppointmentScreen(),
        ),
      );
}
