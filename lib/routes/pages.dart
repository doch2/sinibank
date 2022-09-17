import 'package:get/get.dart';
import 'package:sinibank/middleware/LoginMiddleware.dart';
import 'package:sinibank/pages/home/binding.dart';
import 'package:sinibank/pages/home/page.dart';
import 'package:sinibank/pages/login/binding.dart';
import 'package:sinibank/pages/login/page.dart';
import 'package:sinibank/routes/routes.dart';

class SinibankPages {
  static final pages = [
    GetPage(name: PageRoutes.HOME, page: () => const HomePage(), binding: HomePageBinding(), middlewares: [LoginMiddleware()]),
    GetPage(name: PageRoutes.LOGIN, page: () => const LoginPage(), binding: LoginPageBinding()),
  ];
}
