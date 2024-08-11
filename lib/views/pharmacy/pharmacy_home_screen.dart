import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/navigators/navigators.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';

class PharmacyHomeScreen extends StatelessWidget {
  PharmacyHomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbar(
        title: 'Order List',
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
        actions: const [
          IconButton(
            onPressed: RouteManagement.goToPharmacyNotification,
            icon: Icon(
              Icons.notifications_active_rounded,
              color: Colors.white,
            ),
          )
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
                        child: Icon(Icons.person_rounded),
                      ),
                      Gap(15),
                      Text(
                        'Appollo Pharma',
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
        length: 3,
        initialIndex: 1,
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
                    Tab(text: 'History'),
                    Tab(text: 'Today'),
                    Tab(text: 'Future'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PastOrderList(),
                    TodayOrderList(),
                    FutureOrderList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
