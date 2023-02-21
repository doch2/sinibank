import 'package:get/get.dart';

import '../../services/auth_service.dart';
import 'controller.dart';

class SelectAccountPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectAccountPageController>(() => SelectAccountPageController());
  }
}
