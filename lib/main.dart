import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test12/pages/hadeeth_screen/hadeeth_details_screen.dart';
import 'package:test12/pages/home_screen/home_screen.dart';
import 'package:test12/pages/on_boarding/on_boarding_screen.dart';
import 'package:test12/pages/quran_screen/quran_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? showOnboarding = await prefs.getBool(OnBoardingScreen.routeName);
  runApp(MyApp(
    showOnboarding: showOnboarding,
  ));
}

class MyApp extends StatelessWidget {
  bool? showOnboarding;
  MyApp({required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: showOnboarding == true
          ? HomeScreen.routeName
          : OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsScreen.routeName: (context) => QuranDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) => HadeethDetailsScreen(),
      },
    );
  }
}
