import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sinibank/pages/home/widgets/menu_button.dart';

import '../../routes/routes.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import 'controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: Get.width,
                height: 153,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 80,
                      left: 32,
                      child: Text("홈", style: loginPage_title),
                    )
                  ],
                )
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    menuTitle: "이체",
                    backgroundColor: blueThree,
                    iconWidget: Positioned(
                      bottom: 0,
                      right: -25,
                      child: SvgPicture.asset("assets/images/transfer_image.svg"),
                    ),
                    clickAction: () => Get.toNamed(PageRoutes.ACCOUNTLIST)
                ),
                SizedBox(width: 10),
                MenuButton(
                    menuTitle: "거래\n내역",
                    backgroundColor: blueFour,
                    iconWidget: Positioned(
                      bottom: -20,
                      right: -35,
                      child: SvgPicture.asset("assets/images/history_image.svg"),
                    ),
                    clickAction: () => Get.toNamed(PageRoutes.TRANSACTIONLIST)
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                  menuTitle: "금융\n정보",
                  backgroundColor: yellowOne,
                  iconWidget: Positioned(
                    bottom: -40,
                    right: -50,
                    child: SvgPicture.asset("assets/images/information_image.svg"),
                  ),
                  clickAction: () => Get.toNamed(PageRoutes.FINANCEINFO)
                ),
                SizedBox(width: 10),
                MenuButton(
                  menuTitle: "설정",
                  backgroundColor: blueFive,
                  iconWidget: Positioned(
                    bottom: 0,
                    right: -18,
                    child: SvgPicture.asset("assets/images/setting_image.svg"),
                  ),
                  clickAction: () => print('onClinck'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}





