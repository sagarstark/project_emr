import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:project_emr/controllers/splash/splash.dart';
import 'package:project_emr/res/res.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/logo.jpg')),
              ),
              const Gap(20),
              Text(
                'Jazeera',
                style: Styles.whiteBold16.copyWith(
                  fontSize: Dimens.thirty,
                ),
              ),
            ],
          ),
        ),
      );
}
