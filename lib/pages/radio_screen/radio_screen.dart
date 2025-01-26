import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';

class RadioScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppAssets.radio_bg,
            width: double.infinity, fit: BoxFit.fill, height: double.infinity),
      ]),
    );
  }
}
