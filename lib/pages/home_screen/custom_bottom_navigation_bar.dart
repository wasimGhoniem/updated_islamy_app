import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/taps_name.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onTap;
  CustomBottomNavigationBar({required this.selectedIndex, required this.onTap});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * .1,
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryDark,
          showUnselectedLabels: false,
          unselectedItemColor: AppColors.black,
          selectedItemColor: AppColors.white,
          currentIndex: selectedIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon:
                  buildIconInBottomBar(index: 0, iconPath: AppAssets.quranTap),
              label: TapsName.quranTapName,
            ),
            BottomNavigationBarItem(
              icon:
                  buildIconInBottomBar(index: 1, iconPath: AppAssets.hadethTap),
              label: TapsName.hadethTapName,
            ),
            BottomNavigationBarItem(
              icon:
                  buildIconInBottomBar(index: 2, iconPath: AppAssets.sebhaTap),
              label: TapsName.sebhaTapName,
            ),
            BottomNavigationBarItem(
              icon:
                  buildIconInBottomBar(index: 3, iconPath: AppAssets.radioTap),
              label: TapsName.radioTapName,
            ),
            BottomNavigationBarItem(
              icon: buildIconInBottomBar(index: 4, iconPath: AppAssets.timeTap),
              label: TapsName.timeTapName,
            ),
          ]),
    );
  }

  Widget buildIconInBottomBar({required int index, required String iconPath}) {
    if (selectedIndex == index) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackBg,
        ),
        child: ImageIcon(AssetImage(AppAssets.quranTap)),
      );
    }
    return ImageIcon(AssetImage(iconPath));
  }
}
