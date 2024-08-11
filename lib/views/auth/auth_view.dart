import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/auth/auth.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/res/theme/theme.dart';
import 'package:project_emr/utils/navigators/navigators.dart';
import 'package:project_emr/widgets/widgets.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        id: 'sign-in',
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: Dimens.edgeInsets16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.medical_services_rounded,
                    size: 100,
                    color: ColorsValue.primaryColor,
                  ),
                  const Gap(10),
                  Text(
                    'Welcome to EMR',
                    style: Styles.blackBold16,
                  ),
                  const Gap(50),
                  CustomTextfield(
                    onChange: (value) {
                      controller.update(['sign-in']);
                    },
                    textEditingController: controller.usernameTextController,
                    hintText: 'Username',
                    textInputAction: TextInputAction.next,
                  ),
                  const Gap(15),
                  CustomTextfield(
                    onChange: (value) {
                      controller.update(['sign-in']);
                    },
                    textEditingController: controller.passwordTextController,
                    hintText: 'Password',
                    isObscureText: controller.hidePassword,
                    obscureCharacter: '✶',
                    textInputAction: TextInputAction.done,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword = !controller.hidePassword;
                        controller.update(['sign-in']);
                      },
                      icon: Icon(
                        controller.hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  const Gap(15),
                  Container(
                    width: Get.width,
                    alignment: Alignment.centerLeft,
                    child: ScaleTap(
                      onPressed: RouteManagement.goToforgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: Styles.black14w500
                            .copyWith(color: ColorsValue.primaryColor),
                      ),
                    ),
                  ),
                  const Gap(15),
                  CustomButton(
                    title: 'Continue',
                    isDisable: controller.usernameTextController.text.isEmpty ||
                        controller.passwordTextController.text.isEmpty,
                    onTap: controller.signIn,
                  ),
                  const Gap(15),
                  Container(
                    width: Get.width,
                    alignment: Alignment.centerLeft,
                    child: ScaleTap(
                      onPressed: RouteManagement.goToNationalIdView,
                      child: Text(
                        'Login as a Patient',
                        style: Styles.black14w500
                            .copyWith(color: ColorsValue.primaryColor),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Container(
                    width: Get.width,
                    alignment: Alignment.centerLeft,
                    child: ScaleTap(
                      onPressed: RouteManagement.goToDoctorsHome,
                      child: Text(
                        'Login as a Doctor',
                        style: Styles.black14w500
                            .copyWith(color: ColorsValue.primaryColor),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Container(
                    width: Get.width,
                    alignment: Alignment.centerLeft,
                    child: ScaleTap(
                      onPressed: RouteManagement.goToPharmacyHome,
                      child: Text(
                        'Login as a Pharmacy',
                        style: Styles.black14w500
                            .copyWith(color: ColorsValue.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
