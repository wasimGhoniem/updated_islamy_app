import 'package:flutter/material.dart';

class CustomTitlewidget extends StatelessWidget {
  String imagePath;
  CustomTitlewidget({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height * .015),
      child: Image.asset(imagePath),
    );
  }
}
