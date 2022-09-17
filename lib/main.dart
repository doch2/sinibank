import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinibank/routes/pages.dart';
import 'package:sinibank/routes/routes.dart';
import 'package:sinibank/services/auth_service.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put<AuthService>(AuthService(), permanent: true);

  runApp(
    GetMaterialApp(
      title: '시니뱅크',
      initialRoute: PageRoutes.HOME,
      getPages: SinibankPages.pages,
    ),
  );
}