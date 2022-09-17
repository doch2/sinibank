import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Page"),
            GestureDetector(
              onTap: () => controller.authService.signInWithGoogle(),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(36)
                ),
                child: Center(
                  child: Text("구글로 로그인", style: TextStyle(color: Colors.white, fontSize: 24),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
