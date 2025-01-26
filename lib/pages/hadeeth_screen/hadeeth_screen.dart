import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test12/pages/hadeeth_screen/hadeeth_details_screen.dart';
import 'package:test12/utils/app_style.dart';

import '../../models/hadeeth_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HadeethScreen extends StatefulWidget {
  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {
  @override
  List<HadeethModel> hadeethList = [];

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (hadeethList.isEmpty) {
      loadHadeethFile();
    }
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppAssets.hadeth_bg,
            width: double.infinity, fit: BoxFit.fill, height: double.infinity),
        Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Image.asset(AppAssets.logoImage),
            CarouselSlider.builder(
              itemCount: hadeethList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadeethDetailsScreen.routeName,
                      arguments: hadeethList[itemIndex],
                    );
                  },
                  child: Stack(
                    children: [
                      Image.asset(AppAssets.hadethPageBg,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: double.infinity),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenSize.height * .02,
                            ),
                            Text(
                              hadeethList[itemIndex].title,
                              style: AppStyles.blackBg24W700,
                            ),
                            SizedBox(
                              height: screenSize.height * .04,
                            ),
                            Expanded(
                                child: Text(
                              hadeethList[itemIndex].content.join(''),
                              style: AppStyles.blackBg16W700,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              options: CarouselOptions(
                height: screenSize.height * 0.66,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                enableInfiniteScroll: false,
              ),
            )
          ],
        )
      ]),
    );
  }

  void loadHadeethFile() async {
    for (int i = 0; i < 50; i++) {
      String hadeethContent =
          await rootBundle.loadString('assets/files/Hadeeth/h${i + 1}.txt');

      List<String> hadeethContentList = hadeethContent.split('\n');
      String title = hadeethContentList[0];
      hadeethContentList.removeAt(0);
      HadeethModel hadeethModel =
          HadeethModel(title: title, content: hadeethContentList);
      hadeethList.add(hadeethModel);
      setState(() {});
    }
  }
}
