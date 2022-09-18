import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class FinanceInfoPage extends StatelessWidget {
  const FinanceInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
            onTap: () => Get.offAndToNamed(PageRoutes.FINANCECOMMONSENSE),
            child: ExtendedImage.asset(
              "assets/images/mockup/financeInfo.png",
            ),
          )
      ),
    );
  }
}
