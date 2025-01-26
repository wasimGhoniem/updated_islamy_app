import 'package:flutter/material.dart';
import 'package:test12/pages/hadeeth_screen/hadeeth_details_screen.dart';
import 'package:test12/pages/home_screen/home_screen.dart';
import 'package:test12/pages/quran_screen/quran_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsScreen.routeName: (context) => QuranDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) => HadeethDetailsScreen(),
      },
    );
  }
}
