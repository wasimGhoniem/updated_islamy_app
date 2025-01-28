import 'package:flutter/material.dart';
import 'package:test12/utils/app_style.dart';

import '../../utils/app_assets.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tasbehList = ['سبحان الله', 'الحمد الله', 'الله اكبر'];
  int counter = 0;
  int index = 0;
  double rotationAngel = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppAssets.sebha_bg,
            width: double.infinity, fit: BoxFit.fill, height: double.infinity),
        Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * .02,
                ),
                child: Image.asset(AppAssets.logoImage),
              ),
              SizedBox(
                height: screenSize.height * .03,
              ),
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                style: AppStyles.white36W700,
              ),
              Image.asset(AppAssets.sebhaHead, height: screenSize.height * .1),
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedRotation(
                    duration: Duration(milliseconds: 500),
                    turns: rotationAngel / 360,
                    child: InkWell(
                      onTap: () {
                        tasbehClicked();
                      },
                      child: Image.asset(
                        AppAssets.sebhaBody,
                        height: screenSize.height * .4,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tasbehList[index],
                        style: AppStyles.white36W700,
                      ),
                      SizedBox(
                        height: screenSize.height * .02,
                      ),
                      Text(
                        "$counter",
                        style: AppStyles.white36W700,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }

  void tasbehClicked() {
    setState(() {
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbehList.length;
      } else {
        counter++;
      }
      rotationAngel += 12;
    });
  }
}
