import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle_skill/routes.dart';

class LoginSiswaCtr extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String username = "admin";
  String password = "admin";

  void loginSiswa() {
    if (txtUsername.text.trim() == username &&
        txtPassword.text.trim() == password) {
      Get.toNamed(Routes.main_menu);
      debugPrint("berhasil");
    } else {
      debugPrint("gagal");
      return;
    }
  }
}
