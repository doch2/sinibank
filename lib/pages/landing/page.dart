import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinibank/routes/routes.dart';
import 'package:sinibank/services/finance_openapi_provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Swiper(
            itemBuilder: (BuildContext context, int index){
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(width: Get.width, height: Get.height),
                  ExtendedImage.asset("assets/images/mockup/landing${index+1}.png"),
                  Positioned(
                    bottom: (index==0 ? -500 : 46),
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(PageRoutes.HOME);
                        Get.find<FinanceOpenApiProvider>().authorizeOpenAPI();
                      },
                      child: Container(
                        width: 96,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Center(child: Text("홈으로 가기", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: 2,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),
      ),
    );
  }
}
