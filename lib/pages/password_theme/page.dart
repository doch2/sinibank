import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinibank/routes/routes.dart';

class PasswordThemePage extends StatelessWidget {
  const PasswordThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Get.offAndToNamed(PageRoutes.PASSWORDINPUT, arguments: {"isRegister": true}),
          child: ExtendedImage.asset(
            "assets/images/mockup/password_theme.png",
            scale: 0.9,
          ),
        )
      ),
    );
  }
}
