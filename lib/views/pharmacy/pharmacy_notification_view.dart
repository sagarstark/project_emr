import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class PharmacyNotificationView extends StatelessWidget {
  const PharmacyNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Notifications',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetConstants.notificationPlaceholder,
              height: Dimens.hundred,
              width: Dimens.hundred,
            ),
            const Gap(30),
            Text(
              'No notifications recieved yet.',
              style: Styles.grey14w500,
            ),
          ],
        ),
      ),
    );
  }
}
