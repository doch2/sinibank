import 'package:get/get.dart';

import '../../services/auth_service.dart';
import 'controller.dart';

class TransferMoneyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferMoneyPageController>(() => TransferMoneyPageController());
  }
}
