import 'package:get/get.dart';
import 'package:sinibank/services/auth_service.dart';

class LoginPageController extends GetxController with StateMixin {
  AuthService authService = Get.find<AuthService>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
