import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CheckAvailabilityScreen extends StatefulWidget {
  const CheckAvailabilityScreen({super.key});

  @override
  State<CheckAvailabilityScreen> createState() =>
      _CheckAvailabilityScreenState();
}

class _CheckAvailabilityScreenState extends State<CheckAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'check-availability',
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppbar(
              title: 'Book Appointment',
            ),
            bottomNavigationBar: Padding(
              padding: Dimens.edgeInsets16_0_16_16,
              child: CustomButton(
                title: 'Apply',
                isDisable: false,
                onTap: () {},
              ),
            ),
            body: GetBuilder<HomeController>(
              builder: (controller) {
                return Padding(
                  padding: Dimens.edgeInsets16,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check the slot for your appointment here.',
                        style: Styles.black14,
                      ),
                      const Gap(15),
                      Card(
                        margin: EdgeInsets.zero,
                        color: ColorsValue.secondaryColor,
                        child: Container(
                          width: Get.width,
                          padding: Dimens.edgeInsets10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name - Dr. Sagar K',
                                style: Styles.black14,
                              ),
                              Text(
                                'Experience - 7 Yrs',
                                style: Styles.black14,
                              ),
                              Text(
                                'Speciality - Cardiologist',
                                style: Styles.black14,
                              ),
                              Text(
                                'Date - ${DateFormat('dd MMMM yyyy, EEEE').format(controller.finalSelectedAvailabilityDate)}',
                                style: Styles.black14,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(15),
                      // SizedBox(
                      //   height: Get.height / 1.6,
                      //   child: Center(
                      //     child: SvgPicture.asset(
                      //       AssetConstants.searchDoctor,
                      //       height: Dimens.twoHundred,
                      //       width: Dimens.twoHundred,
                      //       colorFilter: ColorFilter.mode(
                      //         Colors.grey.shade300,
                      //         BlendMode.srcIn,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorsValue.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GetBuilder<HomeController>(
                                id: 'calendar',
                                builder: (controller) {
                                  return SfCalendar(
                                    initialDisplayDate: controller
                                        .finalSelectedAvailabilityDate,

                                    // initialSelectedDate:
                                    //     controller.finalSelectedAvailabilityDate,
                                    view: CalendarView.day,
                                    dataSource: _getCalendarDataSource(),
                                    viewNavigationMode: ViewNavigationMode.none,
                                    viewHeaderHeight: 0,
                                    headerHeight: 0,
                                    showDatePickerButton: false,
                                    todayHighlightColor: Colors.red,
                                    headerDateFormat: 'dd MMMM yyyy, EEEE',
                                    // headerStyle: CalendarHeaderStyle(
                                    //     backgroundColor: ColorsValue.secondaryColor),
                                    timeSlotViewSettings:
                                        const TimeSlotViewSettings(
                                      timeInterval: Duration(minutes: 60),
                                      timeFormat: 'hh:mm aa',
                                      timeRulerSize: 65,
                                      timeIntervalHeight: 150,
                                    ),
                                    appointmentBuilder: (context, details) {
                                      final appointment =
                                          details.appointments.first;
                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        color: ColorsValue.secondaryColor,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              appointment.subject,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Add your button action here
                                                    print(
                                                        'Button clicked for ${appointment.subject}');
                                                  },
                                                  child:
                                                      const Text('Reschedule'),
                                                ),
                                                const Gap(10),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Add your button action here
                                                    print(
                                                        'Button clicked for ${appointment.subject}');
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  _DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day, 9, 0);

    appointments.add(Appointment(
      startTime: startOfDay,
      endTime: startOfDay.add(Duration(hours: 1)),
      subject:
          'Patient Name - Kevin J\nSlotes Booked - 3\nPatient Type - OLD/NEW\n',
    ));
    // appointments.add(Appointment(
    //   startTime: startOfDay.add(Duration(hours: 1)),
    //   endTime: startOfDay.add(Duration(hours: 2)),
    //   subject:
    //       'Patient Name - Kevin J\nSlotes Booked - 3\nPatient Type - OLD/NEW\n',
    // ));
    appointments.add(Appointment(
      startTime: startOfDay.add(Duration(hours: 2)),
      endTime: startOfDay.add(Duration(hours: 3)),
      subject:
          'Patient Name - Kevin J\nSlotes Booked - 3\nPatient Type - OLD/NEW\n',
    ));
    appointments.add(Appointment(
      startTime: startOfDay.add(Duration(hours: 3)),
      endTime: startOfDay.add(Duration(hours: 4)),
      subject:
          'Patient Name - Kevin J\nSlotes Booked - 3\nPatient Type - OLD/NEW\n',
    ));
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
