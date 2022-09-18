import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sinibank/routes/pages.dart';
import 'package:sinibank/routes/routes.dart';
import 'package:sinibank/services/auth_service.dart';
import 'package:sinibank/services/finance_openapi_provider.dart';
import 'package:uni_links/uni_links.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.lazyPut(() => Dio());
  Get.lazyPut(() => FlutterSecureStorage());
  Get.put<AuthService>(AuthService(), permanent: true);
  Get.put<FinanceOpenApiProvider>(FinanceOpenApiProvider(), permanent: true);
  Get.find<FinanceOpenApiProvider>().loadAccessToken();
  StreamSubscription _sub;
  _sub = linkStream.listen((String? link) {
    print(link);
    // Parse the link and warn the user, if it is not correct
  }, onError: (err) {
    print(err);
    // Handle exception by warning the user their action did not succeed
  });


  runApp(
    GetMaterialApp(
      title: '시니뱅크',
      initialRoute: PageRoutes.HOME,
      getPages: SinibankPages.pages,
      debugShowCheckedModeBanner: false
    ),
  );
}