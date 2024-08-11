import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';

class TodayPatientListView extends StatelessWidget {
  const TodayPatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTap(
          onPressed: RouteManagement.goToPatientDetails,
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
                      color: ColorsValue.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/patient.png'),
                  ),
                  const Gap(15),
                  SizedBox(
                    height: Dimens.hundred,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name : Kevin Nash',
                          style: Styles.black14w500,
                        ),
                        Text(
                          'Problem : Dengue',
                          style: Styles.black14,
                        ),
                        Spacer(),
                        Text(
                          'Time : 26/07/2024 - 10:00 AM',
                          style: Styles.black12,
                        ),
                        Text(
                          'Location : Chennai',
                          style: Styles.black12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(15),
        ScaleTap(
          onPressed: RouteManagement.goToPatientDetails,
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
                      color: ColorsValue.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/patient.png'),
                  ),
                  const Gap(15),
                  SizedBox(
                    height: Dimens.hundred,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name : Kevin Nash',
                          style: Styles.black14w500,
                        ),
                        Text(
                          'Problem : Dengue',
                          style: Styles.black14,
                        ),
                        Spacer(),
                        Text(
                          'Time : 26/07/2024 - 10:00 AM',
                          style: Styles.black12,
                        ),
                        Text(
                          'Location : Chennai',
                          style: Styles.black12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
