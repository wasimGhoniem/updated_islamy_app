import 'package:flutter/material.dart';
import 'package:test12/models/sura_model.dart';
import 'package:test12/utils/app_assets.dart';

import '../../utils/app_style.dart';

class SuraListDetails extends StatelessWidget {
  int index;
  SuraModel suraModel;
  SuraListDetails({required this.index, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Stack(alignment: Alignment.center, children: [
          Image.asset(AppAssets.suraNumber),
          Text('${index + 1}', style: AppStyles.White20W700),
        ]),
        SizedBox(width: screenSize.width * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              suraModel.suraEnglishName,
              style: AppStyles.White20W700,
            ),
            Text(
              '${suraModel.versesCount} verses',
              style: AppStyles.White14W700,
            ),
          ],
        ),
        Spacer(),
        Text(
          suraModel.suraArabicName,
          style: AppStyles.White20W700,
        ),
      ],
    );
  }
}
