import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferMoneyPageController extends GetxController with StateMixin {
  final moneyAmountTextController = TextEditingController();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
