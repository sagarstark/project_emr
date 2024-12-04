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
      appBar: const CustomAppbar(
        title: 'Forgot/Reset Password',
      ),
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password :',
              style: Styles.blackBold14,
            ),
            const Gap(15),
            Text(
              'Please enter your email',
              style: Styles.black14w500,
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Please enter your email',
              labelText: 'Email',
              textInputAction: TextInputAction.next,
            ),
            const Gap(5),
            Text(
              'Your password will be sent to your email.',
              style: Styles.grey12,
            ),
            const Gap(15),
            CustomButton(
              title: 'Continue',
              onTap: Get.back,
            ),
            const Gap(40),
            const Row(
              children: [
                Expanded(child: Divider()),
                Gap(10),
                Text('OR'),
                Gap(10),
                Expanded(child: Divider()),
              ],
            ),
            const Gap(40),
            Text('Reset Password :', style: Styles.blackBold14),
            const Gap(15),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Current Password',
              textInputAction: TextInputAction.next,
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'New Password',
              textInputAction: TextInputAction.next,
            ),
            const Gap(10),
            CustomTextfield(
              onChange: (value) {},
              hintText: 'Confirm New Password',
              textInputAction: TextInputAction.next,
            ),
            const Gap(15),
            CustomButton(
              title: 'Confirm',
              onTap: Get.back,
            ),
          ],
        ),
      ),
    );
  }
}
