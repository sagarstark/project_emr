import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:project_emr/res/res.dart';
import 'package:project_emr/utils/utils.dart';
import 'package:project_emr/widgets/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.primaryColor,
      bottomNavigationBar: Padding(
        padding: Dimens.edgeInsets16_10_16_16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDotIndicator(
              pageController: _pageController,
              currentPage: _currentPage,
              itemCount: 3,
              radius: 6,
            ),
            Gap(Dimens.fifteen),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    RouteManagement.goToLogIn();
                  },
                  child: Text(
                    'Skip',
                    style: Styles.white14w500,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      RouteManagement.goToLogIn();
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(
                    'Next',
                    style: Styles.white14w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.sixteen),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/onboarding_1.svg'),
                  Text(
                    'Your Health, Our Priority',
                    textAlign: TextAlign.center,
                    style: Styles.white16.copyWith(
                      fontSize: Dimens.twentyFive,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Connect with top healthcare professionals from the comfort of your home',
                    textAlign: TextAlign.center,
                    style: Styles.white16w500,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.sixteen),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/onboarding_2.svg'),
                  Text(
                    'Easy Appointments, Anytime',
                    textAlign: TextAlign.center,
                    style: Styles.white16.copyWith(
                      fontSize: Dimens.twentyFive,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Schedule consultations at your convenience with just a few taps.',
                    textAlign: TextAlign.center,
                    style: Styles.white16w500,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.sixteen),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/onboarding_3.svg'),
                  Text(
                    'Personalized Care for You',
                    textAlign: TextAlign.center,
                    style: Styles.white16.copyWith(
                      fontSize: Dimens.twentyFive,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Receive tailored health advice and treatment plans from experts',
                    textAlign: TextAlign.center,
                    style: Styles.white16w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
