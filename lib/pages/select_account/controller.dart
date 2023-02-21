import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thecheat_flutter/thecheat_flutter.dart';

class SelectAccountPageController extends GetxController with StateMixin {
  final accountTextController = TextEditingController();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  checkFraudAccountNum() async {
    FraudSearchResponse response = await ThecheatFraudSearch().search(accountTextController.text, FraudSearchType.account);
    if (response.caution!) {
      return true;
    } else {
      return false;
    }
  }
}
