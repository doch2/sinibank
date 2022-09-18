import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sinibank/pages/home/widgets/menu_button.dart';
import 'package:sinibank/services/toast.dart';

import '../../routes/routes.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import 'controller.dart';

class PasswordInputPage extends GetView<PasswordInputPageController> {
  const PasswordInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isRegister = Get.arguments['isRegister'];

    return Scaffold(
      backgroundColor: blueFive,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(width: Get.width, height: Get.height),
            Positioned(
              top: Get.height * 0.07,
              right: -5,
              child: ExtendedImage.asset("assets/images/home.png", scale: 0.9),
            ),
            Positioned(
              top: Get.height * 0.25,
              child: Text("집 비밀번호를\n${isRegister ? "등록" : "입력"}해주세요.", style: passwordInputTitle),
            ),
            Positioned(
              top: Get.height * 0.44,
              child: SizedBox(
                width: 329,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.passwordTextController,
                  textAlign: TextAlign.center,
                  style: moneyAmountTextField,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 0, style: BorderStyle.none,)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.55,
              right: 42,
              child: GestureDetector(
                onTap: () {
                  if (isRegister) {
                    Get.offAndToNamed(PageRoutes.LANDING);
                  } else {
                    SinibankToast().showToast("송금이 성공적으로 완료되었습니다!");
                    Get.offAndToNamed(PageRoutes.TRANSACTIONLIST);
                  }
                },
                child: Container(
                  width: 114,
                  height: 51,
                  decoration: BoxDecoration(
                    color: blueSix,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("확인", style: passwordInputBtn)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





