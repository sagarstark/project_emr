import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class CheckAvailabilityScreen extends StatefulWidget {
  const CheckAvailabilityScreen({super.key});

  @override
  State<CheckAvailabilityScreen> createState() =>
      _CheckAvailabilityScreenState();
}

final controller = Get.find<HomeController>();
var arguments = {};

class _CheckAvailabilityScreenState extends State<CheckAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'check-availability',
      initState: (state) async {
        arguments = Get.arguments;
        await controller.getDoctorAvailableSlots(
          doctorId: arguments['doctorId'],
          interval: '${controller.selectedDuration}',
          selectedDate: DateFormat('yyyy-MM-dd')
              .format(controller.finalSelectedAvailabilityDate),
        );
      },
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Book Appointment',
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets16_0_16_16,
            child: CustomButton(
              title: 'Book',
              isDisable: controller.selectedSlot.isEmpty,
              onTap: () async {
                await controller.receptionistBookAppointment();
              },
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
                      'Check the slot for your appointment here',
                      style: Styles.black14,
                    ),
                    const Gap(15),
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Colors.blueAccent.withOpacity(0.5),
                      child: Container(
                        width: Get.width,
                        padding: Dimens.edgeInsets10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: ColorsValue.secondaryColor,
                                    radius: 50.0,
                                    foregroundImage: AssetImage(
                                        AssetConstants.doctorProfilePic),
                                  ),
                                  const Gap(15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name : ${arguments['doctorName']}',
                                          style: Styles.blackBold14,
                                        ),
                                        Text(
                                          'Contact : ${arguments['contactInfo']}',
                                          style: Styles.black12w500,
                                        ),
                                        Text(
                                          'Branch : ${arguments['branch']}',
                                          style: Styles.black12w500,
                                        ),
                                        Text(
                                          'Date : ${DateFormat('dd MMMM yyyy, EEEE').format(controller.finalSelectedAvailabilityDate)}',
                                          style: Styles.black12w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(5),
                    const Divider(),
                    const Gap(5),
                    Text(
                      'Select the slot duration',
                      style: Styles.black14,
                    ),
                    const Gap(10),
                    GetBuilder<HomeController>(
                      builder: (controller) {
                        return Wrap(
                          runSpacing: 1,
                          spacing: 10,
                          children: List.generate(
                            controller.durationList.length,
                            (index) => RawChip(
                              avatar: Icon(
                                Icons.access_time_rounded,
                                color: controller.selectedDuration ==
                                        controller.durationList[index]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              label: Text(
                                  '${controller.durationList[index]} minutes'),
                              labelStyle: controller.selectedDuration ==
                                      controller.durationList[index]
                                  ? Styles.white12w500
                                  : Styles.black12w500,
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.fifty),
                              ),
                              selected: controller.selectedDuration ==
                                  controller.durationList[index],
                              selectedColor: controller.selectedDuration ==
                                      controller.durationList[index]
                                  ? Colors.blueAccent
                                  : Colors.white,
                              backgroundColor: Colors.white,
                              onPressed: () async {
                                controller.selectedDuration =
                                    controller.durationList[index];

                                await controller.getDoctorAvailableSlots(
                                  doctorId: arguments['doctorId'],
                                  interval: '${controller.selectedDuration}',
                                  selectedDate: DateFormat('yyyy-MM-dd').format(
                                      controller.finalSelectedAvailabilityDate),
                                );
                                controller.update(['check-availability']);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(5),
                    const Divider(),
                    const Gap(5),
                    Text(
                      'Select a Slot :',
                      style: Styles.black16w500,
                    ),
                    const Gap(10),
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Builder(
                          builder: (context) {
                            TabController tabController =
                                DefaultTabController.of(context);
                            tabController.addListener(
                              () {
                                if (!tabController.indexIsChanging) {
                                  controller.slotCurrentTab = [
                                    'Morning',
                                    'Afternoon',
                                    'Evening'
                                  ][tabController.index];
                                }
                              },
                            );
                            return Column(
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
                                    labelStyle: Styles.white14w500
                                        .copyWith(fontFamily: 'Poppins'),
                                    indicator: BoxDecoration(
                                      color: ColorsValue.primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.fifty),
                                      ),
                                    ),
                                    tabs: const [
                                      Tab(text: 'Morning'),
                                      Tab(text: 'Afternoon'),
                                      Tab(text: 'Evening'),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: TabBarView(
                                    children: [
                                      MorningAvailability(),
                                      AfternoonAvailability(),
                                      EveningAvailability(),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class MorningAvailability extends StatelessWidget {
  const MorningAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'check-availability',
      builder: (controller) {
        return controller.isGetDoctorSlotLoading
            ? const CustomLoader()
            : controller.doctorsAvailableSlot == null ||
                    controller.doctorsAvailableSlot!.morning!.available!.isEmpty
                ? const Center(
                    child: Text('No Slots Available.'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight10,
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 1,
                            spacing: 10,
                            children: List.generate(
                              controller.doctorsAvailableSlot!.morning!
                                          .available ==
                                      null
                                  ? 0
                                  : controller.doctorsAvailableSlot!.morning!
                                      .available!.length,
                              (index) {
                                var slotList = controller
                                    .doctorsAvailableSlot!.morning!.available;
                                return RawChip(
                                  label: Text(
                                      '${slotList![index].start!} - ${slotList[index].end!}'),
                                  labelStyle: controller.selectedSlot ==
                                          '${slotList[index].start}'
                                      ? Styles.whiteBold12
                                      : Styles.black12,
                                  showCheckmark: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.fifty),
                                  ),
                                  selected: controller.selectedSlot ==
                                      '${slotList[index].start}',
                                  selectedColor: Colors.blueAccent,
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    controller.selectedSlot =
                                        '${slotList[index].start}';
                                    AppLog(controller.selectedSlot);
                                    controller.update(['check-availability']);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}

class AfternoonAvailability extends StatelessWidget {
  const AfternoonAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'check-availability',
      builder: (controller) {
        return controller.isGetDoctorSlotLoading
            ? const CustomLoader()
            : controller.doctorsAvailableSlot == null ||
                    controller
                        .doctorsAvailableSlot!.afternoon!.available!.isEmpty
                ? const Center(
                    child: Text('No Slots Available.'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight10,
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 1,
                            spacing: 10,
                            children: List.generate(
                              controller.doctorsAvailableSlot!.afternoon!
                                          .available ==
                                      null
                                  ? 0
                                  : controller.doctorsAvailableSlot!.afternoon!
                                      .available!.length,
                              (index) {
                                var slotList = controller
                                    .doctorsAvailableSlot!.afternoon!.available;
                                return RawChip(
                                  label: Text(
                                      '${slotList![index].start!} - ${slotList[index].end!}'),
                                  labelStyle: controller.selectedSlot ==
                                          '${slotList[index].start}'
                                      ? Styles.whiteBold12
                                      : Styles.black12,
                                  showCheckmark: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.fifty),
                                  ),
                                  selected: controller.selectedSlot ==
                                      '${slotList[index].start}',
                                  selectedColor: Colors.blueAccent,
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    controller.selectedSlot =
                                        '${slotList[index].start}';
                                    AppLog(controller.selectedSlot);
                                    controller.update(['check-availability']);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}

class EveningAvailability extends StatelessWidget {
  const EveningAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'check-availability',
        builder: (controller) {
          return controller.isGetDoctorSlotLoading
              ? const CustomLoader()
              : controller.doctorsAvailableSlot == null ||
                      controller
                          .doctorsAvailableSlot!.evening!.available!.isEmpty
                  ? const Center(
                      child: Text('No Slots Available.'),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Dimens.boxHeight10,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Wrap(
                              runSpacing: 1,
                              spacing: 10,
                              children: List.generate(
                                controller.doctorsAvailableSlot!.evening!
                                            .available ==
                                        null
                                    ? 0
                                    : controller.doctorsAvailableSlot!.evening!
                                        .available!.length,
                                (index) {
                                  var slotList = controller
                                      .doctorsAvailableSlot!.evening!.available;
                                  return RawChip(
                                    label: Text(
                                        '${slotList![index].start!} - ${slotList[index].end!}'),
                                    labelStyle: controller.selectedSlot ==
                                            '${slotList[index].start}'
                                        ? Styles.whiteBold12
                                        : Styles.black12,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.fifty),
                                    ),
                                    selected: controller.selectedSlot ==
                                        '${slotList[index].start}',
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      controller.selectedSlot =
                                          '${slotList[index].start}';
                                      AppLog(controller.selectedSlot);
                                      controller.update(['check-availability']);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
        });
  }
}
