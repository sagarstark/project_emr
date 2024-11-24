import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';
import 'package:project_emr/widgets/widgets.dart';
import 'appointment_card.dart';

class DoctorsPastAppointment extends StatelessWidget {
  const DoctorsPastAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'past-doctor-appointment',
      initState: (state) async {
        final controller = Get.find<HomeController>();
        await controller.getDoctorsAppointment(
            filters: 'past', updateId: 'past-doctor-appointment');
      },
      builder: (controller) {
        return controller.isAppointmentLoading
            ? const CustomLoader()
            : controller.doctorsAppointmentModel == null ||
                    controller.doctorsAppointmentModel!.data == null ||
                    controller.doctorsAppointmentModel!.data!.isEmpty
                ? const Center(
                    child: Text('No Appointments Available.'),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        controller.doctorsAppointmentModel?.data?.length ?? 0,
                    separatorBuilder: (context, index) => const Gap(10),
                    itemBuilder: (context, index) {
                      return AppointmentCard(
                        appointment:
                            controller.doctorsAppointmentModel!.data![index],
                      );
                    },
                  );
      },
    );
  }
}
