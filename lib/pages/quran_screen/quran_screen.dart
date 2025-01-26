import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test12/models/sura_model.dart';
import 'package:test12/pages/quran_screen/quran_details_screen.dart';
import 'package:test12/pages/quran_screen/suraListDetails.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';

class QuranScreen extends StatefulWidget {
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
        suraArabicName: SuraModel.suraArabicList[i],
        suraEnglishName: SuraModel.suraEnglishList[i],
        versesCount: SuraModel.versesCountList[i],
        fileName: '${i + 1}.txt',
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<SuraModel> filteredList = SuraModel.suraList;
  Map<String, String> loadSuraList = {};

  String searchText = '';

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(AppAssets.backgroundImage,
            width: double.infinity, fit: BoxFit.fill, height: double.infinity),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.03),
              Image.asset(
                AppAssets.logoImage,
              ),
              SizedBox(height: screenSize.height * 0.02),
              TextField(
                onChanged: (text) {
                  searchText = text;
                  filteredList = SuraModel.suraList.where((suraModel) {
                    return suraModel.suraArabicName.contains(searchText) ||
                        suraModel.suraEnglishName
                            .toLowerCase()
                            .contains(searchText.toLowerCase());
                  }).toList();
                  setState(() {});
                },
                style: AppStyles.OffWhite16W700,
                cursorColor: AppColors.primaryDark,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(AppAssets.prefixSearch),
                  hintText: 'sura name',
                  hintStyle: AppStyles.OffWhite16W700,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryDark,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryDark,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryDark,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryDark,
                      )),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              searchText.isEmpty ? buildMostRecentlyWidget() : SizedBox(),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Text(
                    'Sura list',
                    style: AppStyles.OffWhite16W700,
                  ),
                ],
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              // save last sura
                              savaSuraContent(
                                  suraArabicName:
                                      filteredList[index].suraArabicName,
                                  suraEnglishName:
                                      filteredList[index].suraEnglishName,
                                  versesCount: filteredList[index].versesCount);

                              Navigator.pushNamed(
                                context,
                                QuranDetailsScreen.routeName,
                                arguments: filteredList[index],
                              );
                            },
                            child: SuraListDetails(
                              suraModel: filteredList[index],
                              index: index,
                            ));
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: AppColors.white,
                            indent: screenSize.width * 0.14,
                            endIndent: screenSize.width * 0.14,
                            thickness: 1.5,
                          ),
                      itemCount: filteredList.length)),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildMostRecentlyWidget() {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Most Recently',
              style: AppStyles.OffWhite16W700,
            ),
          ],
        ),
        SizedBox(height: screenSize.height * 0.02),
        Container(
          padding: EdgeInsets.all(8),
          width: screenSize.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryDark,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loadSuraList['suraEnglishName'] ?? ''),
                Text(loadSuraList['suraArabicName'] ?? ''),
                Text(loadSuraList['versesCount'] ?? ''),
              ],
            ),
            Image.asset(AppAssets.mostRecently),
          ]),
        ),
      ],
    );
  }

  // shared preferences to build the logic in most recently container
  savaSuraContent(
      {required String suraArabicName,
      required String suraEnglishName,
      required String versesCount}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraArabicName', suraArabicName);
    await prefs.setString('suraEnglishName', suraEnglishName);
    await prefs.setString('versesCount', versesCount);
    await loadLastSura();
  }

  getSuraContent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraArabicName = prefs.getString('suraArabicName') ?? '';
    String suraEnglishName = prefs.getString('suraEnglishName') ?? '';
    String versesCount = prefs.getString('versesCount') ?? '';

    return {
      'suraArabicName': suraArabicName,
      'suraEnglishName': suraEnglishName,
      'versesCount': versesCount,
    };
  }

  loadLastSura() async {
    loadSuraList = await getSuraContent();
    setState(() {});
  }
}
