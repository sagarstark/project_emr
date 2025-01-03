import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/views/doctor/doctors.dart';
import 'package:project_emr/views/views.dart';
import 'package:project_emr/widgets/widgets.dart';

class DoctorsAppointmentView extends StatelessWidget {
  const DoctorsAppointmentView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppbar(
          title: 'Appointments',
        ),
        body: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Column(
            children: [
              Container(
                margin: Dimens.edgeInsets16_10_16_10,
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
                    Tab(text: 'Past'),
                    Tab(text: 'Today'),
                    Tab(text: 'Future'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DoctorsPastAppointment(),
                    DoctorsTodayAppointment(),
                    DoctorsFutureAppointment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
