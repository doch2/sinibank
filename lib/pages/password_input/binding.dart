import 'package:get/get.dart';

import '../../services/auth_service.dart';
import 'controller.dart';

class PasswordInputPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordInputPageController>(() => PasswordInputPageController());
  }
}
