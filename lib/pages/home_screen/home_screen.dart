

import 'package:flutter/material.dart';


import '../hadeeth_screen/hadeeth_screen.dart';
import '../quran_screen/quran_screen.dart';
import '../radio_screen/radio_screen.dart';
import '../sebha_screen/sebha_screen.dart';
import '../time_screen/time_screen.dart';
import 'custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget>Screens=[
  QuranScreen(),
    HadeethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex:selectedIndex ,
          onTap:(index){
            setState(() {
              selectedIndex=index;

            });
          } ,),
      body: Screens[selectedIndex],

    );
  }

}
