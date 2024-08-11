import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';

class ReceptionistHomeScreen extends StatelessWidget {
  ReceptionistHomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
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
                      'Kevin (Receptionist)',
                      style: Styles.white16w500,
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
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: Dimens.edgeInsets16_10_16_16,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50)),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    overlayColor: WidgetStateColor.transparent,
                    labelColor: Colors.white,
                    labelStyle:
                        Styles.white14w500.copyWith(fontFamily: 'Poppins'),
                    indicator: BoxDecoration(
                      color: ColorsValue.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.fifty),
                      ),
                    ),
                    tabs: const [
                      Tab(text: 'Appointment'),
                      Tab(text: 'Registration'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ReseptionistAppointmentScreen(),
                      ReceptionistRegistrationScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
