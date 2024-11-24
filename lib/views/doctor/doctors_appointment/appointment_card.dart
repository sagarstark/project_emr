import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:intl/intl.dart';
import 'package:project_emr/models/models.dart';
import 'package:project_emr/res/res.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentData appointment;

  const AppointmentCard({
    super.key,
    required this.appointment,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.lightBlue;
      case 'old':
        return Colors.orange;
      case 'revisit':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.red;
    }
  }

  String _formatTime(String time) {
    final timeComponents = time.split(':');
    return '${timeComponents[0]}:${timeComponents[1]}';
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: Dimens.edgeInsets16_0_16_0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      surfaceTintColor: _getStatusColor('${appointment.appointmentStatus}'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_rounded,
                        size: 20,
                        color:
                            _getStatusColor('${appointment.appointmentStatus}'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${appointment.patientName}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor('${appointment.appointmentStatus}')
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${appointment.appointmentStatus}'.toString().toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          _getStatusColor('${appointment.appointmentStatus}'),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              children: [
                Icon(
                  Icons.person_pin_rounded,
                  size: 18,
                  color: _getStatusColor('${appointment.appointmentStatus}'),
                ),
                const SizedBox(width: 8),
                Text(
                  'Appointment ID : ${appointment.appointmentId}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Gap(5),
            Row(
              children: [
                Icon(
                  Icons.medical_services_rounded,
                  size: 18,
                  color: _getStatusColor('${appointment.appointmentStatus}'),
                ),
                const SizedBox(width: 8),
                Text(
                  '${appointment.speciality}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Gap(5),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: 18,
                  color: _getStatusColor('${appointment.appointmentStatus}'),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatDate('${appointment.appointmentDate}'),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.access_time,
                  size: 18,
                  color: _getStatusColor('${appointment.appointmentStatus}'),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatTime('${appointment.appointmentTime}'),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
