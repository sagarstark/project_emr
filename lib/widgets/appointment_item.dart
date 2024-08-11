import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:project_emr/res/res.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    super.key,
    required this.branchName,
    required this.ontap,
  });

  final String branchName;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: ontap,
      child: Card(
        elevation: 10,
        color: ColorsValue.secondaryColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF015D67), Colors.cyan],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(Dimens.ten),
              child: Text(
                branchName,
                style: Styles.white14w500,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
