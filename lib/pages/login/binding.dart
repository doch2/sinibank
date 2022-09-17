import 'package:get/get.dart';
import 'package:sinibank/services/auth_service.dart';

import 'controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
