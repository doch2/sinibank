import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ExtendedImage.asset(
            "assets/images/mockup/transactionList.png",
            scale: 0.9,
          )
      ),
    );
  }
}
