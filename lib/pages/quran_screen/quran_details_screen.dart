import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test12/models/sura_model.dart';
import 'package:test12/utils/app_assets.dart';
import 'package:test12/utils/app_style.dart';

import '../../utils/app_colors.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = 'QuranDetailsScreen';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      getSuraContent(args.fileName);
    }
    return Scaffold(
      backgroundColor: AppColors.blackBgFull,
      appBar: AppBar(
        backgroundColor: AppColors.blackBgFull,
        foregroundColor: AppColors.primaryDark,
        title: Text(args.suraEnglishName),
        centerTitle: true,
      ),
      body: Stack(children: [
        Image.asset(
          AppAssets.suraDetailsFrame,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                args.suraArabicName,
                style: AppStyles.primary20W700,
              ),
              SizedBox(
                height: screenSize.height * 0.06,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryDark),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: AppColors.primaryDark)),
                            child: Text(
                              verses[index],
                              style: AppStyles.primary20W700,
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void getSuraContent(String fileName) async {
    String suraContent =
        await rootBundle.loadString('assets/files/Suras/$fileName');
    List<String> suraLines = suraContent.split('\n');

    verses = suraLines;
    setState(() {});
  }
}
