import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

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
                        'Check the slot for your appointment here',
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
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor:
                                          ColorsValue.secondaryColor,
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
                                            'Name - Dr. Suresh Joshi',
                                            style: Styles.blackBold14,
                                          ),
                                          Text(
                                            'Speciality - Haematology',
                                            style: Styles.black12w500,
                                          ),
                                          Text(
                                            'Date - ${DateFormat('dd MMMM yyyy, EEEE').format(controller.finalSelectedAvailabilityDate)}',
                                            style: Styles.black12w500,
                                          ),
                                          Text(
                                            'Branch - Chennai',
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
                      const Gap(15),
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
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                label: Text(controller.durationList[index]),
                                labelStyle: controller.selectedDuration ==
                                        controller.durationList[index]
                                    ? Styles.black12w500
                                    : Styles.grey12w500,
                                showCheckmark: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.fifty),
                                ),
                                selected: controller.selectedDuration ==
                                    controller.durationList[index],
                                selectedColor: controller.selectedDuration ==
                                        controller.durationList[index]
                                    ? ColorsValue.secondaryColor
                                    : Colors.white,
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  controller.selectedDuration =
                                      controller.durationList[index];
                                  controller.update();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const Gap(16),
                      Expanded(
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
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
}

class MorningAvailability extends StatelessWidget {
  const MorningAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Dimens.boxHeight16,
        Text(
          'Select a Slot :',
          style: Styles.black16w500,
        ),
        Dimens.boxHeight10,
        Expanded(
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Wrap(
                  runSpacing: 1,
                  spacing: 10,
                  children: List.generate(
                    controller.timeSlots.length,
                    (index) => RawChip(
                      label: Text(controller.timeSlots[index]),
                      labelStyle:
                          controller.selectedSlot == controller.timeSlots[index]
                              ? Styles.whiteBold12
                              : Styles.black12,
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.fifty),
                      ),
                      selected: controller.selectedSlot ==
                          controller.timeSlots[index],
                      selectedColor:
                          controller.selectedSlot == controller.timeSlots[index]
                              ? ColorsValue.primaryColor
                              : Colors.white,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        controller.selectedSlot = controller.timeSlots[index];
                        controller.update();
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AfternoonAvailability extends StatelessWidget {
  const AfternoonAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Afternoon Availability'),
    );
  }
}

class EveningAvailability extends StatelessWidget {
  const EveningAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Evening Availability'),
    );
  }
}
