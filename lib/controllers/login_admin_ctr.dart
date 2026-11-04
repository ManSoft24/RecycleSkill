import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle_skill/routes.dart';
import "package:http/http.dart" as http;

import 'dart:convert';

class LoginAdminCtr extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String username = "admin";
  String password = "admin";

  var isLoading = false.obs;

  void loginAdmin() async {
    if (txtUsername.text.toString().isEmpty ||
        txtPassword.text.toString().isEmpty) {
      Get.snackbar('Error', 'Username dan Password tidak boleh kosong');
      txtUsername.clear();
      txtPassword.clear();
    } else {
      try {
        isLoading.value = true;
        final url = Uri.parse('https://mediadwi.com/api/latihan/login');

        final response = await http.post(
          url,
          body: {
            'username': txtUsername.text.toString(),
            'password': txtPassword.text.toString(),
          },
        );
        isLoading.value = false;

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['status'] == true) {
            Get.snackbar(
              data['message'],
              'Selamat Datang ' + txtUsername.text.toString(),
            );
            Get.offNamed(Routes.main_menu);
            debugPrint("berhasil");
          } else {
            Get.snackbar('Error', 'Username atau Password salah');
            debugPrint("gagal");
            txtUsername.clear();
            txtPassword.clear();
          }
        } else {
          Get.snackbar('Error', 'Terjadi kesalahan');
          debugPrint("response status code: ${response.statusCode}");
          txtUsername.clear();
          txtPassword.clear();
        }
      } catch (e) {
        debugPrint("error: $e");
      }
    }
  }
}
