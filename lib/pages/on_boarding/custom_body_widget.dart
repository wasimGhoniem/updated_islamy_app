import 'package:flutter/material.dart';
import 'package:test12/utils/app_style.dart';

class CustomBodyWidget extends StatelessWidget {
  String imagePath;
  String text;
  String text2;
  bool isFirstPage;
  CustomBodyWidget(
      {required this.imagePath,
      required this.text,
      required this.text2,
      this.isFirstPage = false});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: MediaQuery.of(context).size.height * .35,
        ),
        SizedBox(
            height: isFirstPage
                ? screenSize.height * .16
                : screenSize.height * .02),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.primary24W700,
        ),
        SizedBox(
          height: screenSize.height * .07,
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: AppStyles.primary20W700,
        ),
      ],
    );
  }
}
