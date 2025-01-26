import 'package:flutter/material.dart';
import 'package:test12/models/hadeeth_model.dart';
import 'package:test12/utils/app_style.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HadeethDetailsScreen extends StatelessWidget {
  static const String routeName = 'HadeethDetailsScreen';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)!.settings.arguments as HadeethModel;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryDark,
        backgroundColor: AppColors.blackBgFull,
        title: Text(args.title),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.blackBgFull,
        child: Stack(children: [
          Image.asset(AppAssets.suraDetailsFrame,
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(args.title, style: AppStyles.primary20W700),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      args.content[index],
                      style: AppStyles.primary20W700,
                      textAlign: TextAlign.center,
                    );
                  },
                  itemCount: args.content.length,
                )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
