import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxBool isLoading = false.obs;

  /// Login button with email and password
  login() async {}
}
