import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppAssets.sebha_bg,
            width: double.infinity, fit: BoxFit.fill, height: double.infinity),
      ]),
    );
  }
}
