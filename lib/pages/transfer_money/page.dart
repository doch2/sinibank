import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sinibank/pages/home/widgets/menu_button.dart';

import '../../routes/routes.dart';
import '../../themes/color_theme.dart';
import '../../themes/text_theme.dart';
import 'controller.dart';

class TransferMoneyPage extends GetView<TransferMoneyPageController> {
  const TransferMoneyPage({Key? key}) : super(key: key);

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
                  Text("얼마를\n송금할까요?", style: loginPage_title.copyWith(fontSize: 43)),
                  SizedBox(height: 32),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 329,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.moneyAmountTextController,
                          textAlign: TextAlign.center,
                          style: moneyAmountTextField,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 0, style: BorderStyle.none,)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        child: Text("원", style: moneyAmountTextFieldHintWon),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Get.offAndToNamed(PageRoutes.PASSWORDINPUT, arguments: {"isRegister": false}),
                    child: Container(
                      width: 268,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 24),
                          ExtendedImage.asset("assets/images/multipleCard.png", width: 32),
                          SizedBox(width: 12),
                          Text("송금하기", style: moneyAmountButton)
                        ],
                      ),
                    ),
                  )
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





