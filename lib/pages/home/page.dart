import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sinibank/services/finance_openapi_provider.dart';

import 'controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () async => print(await Get.find<FinanceOpenApiProvider>().authorizeOpenAPI()),
                child: Text("인증하러가기", style: TextStyle(fontSize: 24)),
              )
            ],
          )
      ),
    );
  }
}
