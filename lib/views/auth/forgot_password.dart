import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset your password from here.',
              style: Styles.black14,
            ),
            const Gap(15),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Email/Phone',
              textInputAction: TextInputAction.next,
            ),
            const Gap(15),
            CustomButton(
              title: 'Continue',
              onTap: Get.back,
            ),
          ],
        ),
      ),
    );
  }
}
