import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sinibank/pages/home/widgets/menu_button.dart';

import '../../routes/routes.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import 'controller.dart';

class SelectAccountPage extends GetView<SelectAccountPageController> {
  const SelectAccountPage({Key? key}) : super(key: key);

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
                      child: Text("송금", style: loginPage_title),
                    )
                  ],
                )
            ),
            SizedBox(height: 70),
            SizedBox(
              width: 329,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 329,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.accountTextController,
                          textAlign: TextAlign.start,
                          style: accountTextField,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.02, horizontal: 24),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 0, style: BorderStyle.none,)),
                            fillColor: Colors.white,
                            hintText: "계좌번호를 입력해주세요",
                            filled: true,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        child: GestureDetector(
                          onTap: () async {
                            if (!(await controller.checkFraudAccountNum())) {
                              Get.offAndToNamed(PageRoutes.TRANSFERMONEY);
                            } else {
                              Get.offAndToNamed(PageRoutes.FRAUDACCOUNT);
                            }
                          },
                          child: Icon(Icons.search_rounded, size: 48, color: grayTwo)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Text("최근 입금 계좌", style: loginPage_title.copyWith(fontSize: 36)),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}





