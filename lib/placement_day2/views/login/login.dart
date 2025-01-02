import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/helper.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController(), permanent: true);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text(
          'Login Page',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 25,
              letterSpacing: 2),
        ),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    color: Colors.grey.shade50),
              ]),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    cursorColor: Colors.blue.shade900,
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.blue.shade900),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue.shade900))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.blue.shade900,
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blue.shade900),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue.shade900))),
                    obscureText: true,
                  ),
                  SizedBox(height: 40),
                  Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.black,
                        )
                      : CupertinoButton(
                          color: Colors.blue.shade900,
                          onPressed: () => controller.login(
                            usernameController.text,
                            passwordController.text,
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(letterSpacing: 2),
                          ),
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
