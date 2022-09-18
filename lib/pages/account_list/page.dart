import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinibank/routes/routes.dart';

class AccountListPage extends StatelessWidget {
  const AccountListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
            onTap: () => Get.offAndToNamed(PageRoutes.TRANSFERMONEY),
            child: ExtendedImage.asset(
              "assets/images/mockup/accountList.png",
              scale: 1.2,
            ),
          )
      ),
    );
  }
}
