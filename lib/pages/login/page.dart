import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinibank/pages/login/widgets/login_button.dart';
import 'package:sinibank/themes/text_theme.dart';

import '../../themes/color_theme.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueOne,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 265,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 120,
                    left: 32,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("로그인", style: loginPage_title),
                        SizedBox(height: 12),
                        Text("시니어를 위한, 시니어를 위한", style: loginPage_subTitle),
                        Text("시니뱅크에 오신 걸 환영합니다!", style: loginPage_subTitle.copyWith(color: blueTwo))
                      ],
                    ),
                  )
                ],
              )
            ),
            SizedBox(height: 100),
            LoginButton(btnType: LoginButtonType.google, clickAction: () => controller.authService.signInWithGoogle()),
            SizedBox(height: 20),
            LoginButton(btnType: LoginButtonType.apple, clickAction: () => controller.authService.signInWithApple()),
          ],
        ),
      ),
    );
  }
}
