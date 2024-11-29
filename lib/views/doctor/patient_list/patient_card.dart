import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';

class PatientCardInDoctorsList extends StatelessWidget {
  final String name;
  final String problem;
  final String time;
  final String location;
  final String imageAsset;
  final VoidCallback onPressed;

  const PatientCardInDoctorsList({
    super.key,
    required this.name,
    required this.problem,
    required this.time,
    required this.location,
    required this.imageAsset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: onPressed,
      child: Card(
        elevation: 5,
        margin: Dimens.edgeInsets16_0_16_0,
        child: Padding(
          padding: Dimens.edgeInsets10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimens.hundred,
                width: Dimens.hundred,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(imageAsset),
              ),
              const Gap(15),
              Expanded(
                child: SizedBox(
                  height: Dimens.hundred,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name : $name',
                        style: Styles.black14w500,
                      ),
                      Text(
                        'Problem : $problem',
                        style: Styles.black14,
                      ),
                      Spacer(),
                      Text(
                        'Time : $time',
                        style: Styles.black12,
                      ),
                      Text(
                        'Location : $location',
                        style: Styles.black12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
