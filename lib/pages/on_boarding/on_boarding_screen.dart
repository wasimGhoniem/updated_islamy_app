import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test12/pages/home_screen/home_screen.dart';
import 'package:test12/pages/on_boarding/custom_body_widget.dart';
import 'package:test12/pages/on_boarding/custom_title_widget.dart';

import 'package:test12/utils/app_colors.dart';
import 'package:test12/utils/app_style.dart';

import '../../utils/app_assets.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'OnBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return IntroductionScreen(
      globalBackgroundColor: AppColors.blackBgFull,
      showNextButton: true,
      showBackButton: currentPage != 0 ? true : false,
      onChange: (index) {
        currentPage = index;
        setState(() {});
      },
      skip: Text(
        "Skip",
        style: AppStyles.primary16W700,
      ),
      onSkip: () {
        goToHome();
        saveOnBoarding();
      },
      showSkipButton: currentPage == 0 ? true : false,
      next: Text(
        "Next",
        style: AppStyles.primary16W700,
      ),
      back: Text(
        'Back',
        style: AppStyles.primary16W700,
      ),
      done: Text(
        "Done",
        style: AppStyles.primary16W700,
      ),
      onDone: () {
        goToHome();
        saveOnBoarding();
      },
      animationDuration: 100,
      dotsFlex: 4,
      dotsDecorator: DotsDecorator(
        color: AppColors.gray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        activeColor: AppColors.primaryDark,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: CustomTitlewidget(imagePath: AppAssets.logoImage),
          bodyWidget: CustomBodyWidget(
            imagePath: AppAssets.onboardingScreen,
            text: 'Welcome To Islmi App',
            text2: '',
            isFirstPage: true,
          ),
        ),
        PageViewModel(
          titleWidget: CustomTitlewidget(imagePath: AppAssets.logoImage),
          bodyWidget: CustomBodyWidget(
            imagePath: AppAssets.onboardingScreen1,
            text: 'Welcome To Islmi App',
            text2: 'We Are Very Excited To Have You In Our Community',
          ),
        ),
        PageViewModel(
          titleWidget: CustomTitlewidget(imagePath: AppAssets.logoImage),
          bodyWidget: CustomBodyWidget(
            imagePath: AppAssets.onboardingScreen2,
            text: 'Reading the Quran',
            text2: 'Read, and your Lord is the Most Generous',
          ),
        ),
        PageViewModel(
          titleWidget: CustomTitlewidget(imagePath: AppAssets.logoImage),
          bodyWidget: CustomBodyWidget(
            imagePath: AppAssets.onboardingScreen3,
            text: 'Bearish',
            text2: 'Praise the name of your Lord, the Most High',
          ),
        ),
        PageViewModel(
          titleWidget: CustomTitlewidget(imagePath: AppAssets.logoImage),
          bodyWidget: CustomBodyWidget(
            imagePath: AppAssets.onboardingScreen4,
            text: 'Holy Quran Radio',
            text2:
                'You can listen to the Holy Quran Radio through the application for free and easily',
          ),
        ),
      ],
    );
  }

  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  Future<void> saveOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(OnBoardingScreen.routeName, true);
  }
}
