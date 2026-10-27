import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recycle_skill/components/login_form/custom_check_box.dart';
import 'package:recycle_skill/components/login_form/header_login_form.dart';
import 'package:recycle_skill/components/login_form/headertext_login_form.dart';
import 'package:recycle_skill/components/login_form/login_btn_alt.dart';
import 'package:recycle_skill/components/login_form/login_loginform_btn.dart';
import 'package:recycle_skill/components/login_form/login_form_tf.dart';
import 'package:recycle_skill/components/login_form/login_password_tf.dart';
import 'package:recycle_skill/controllers/login_siswa_ctr.dart';

class LoginSiswaPages extends StatelessWidget {
  LoginSiswaPages({super.key});

  final controller = Get.put(LoginSiswaCtr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),

            HeaderLoginForm(
              user: 'Masuk ke akun konsumen Anda',
              label: 'Selamat Datang',
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 35.0, top: 20.0, bottom: 10.0),
              child: HeadertextLoginForm(
                color: Color.fromARGB(255, 61, 74, 66),
                fontSize: 15,
                fontWeight: 500,
                text: 'Username',
                letterSpacing: -0.55,
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: LoginFormTextField(
                obscure: false,
                txtController: controller.txtUsername,
                theHint: "Username",
                icon: Icons.person_2_outlined,
              ),
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 35.0, bottom: 10.0),
                  child: HeadertextLoginForm(
                    color: Color.fromARGB(255, 61, 74, 66),
                    fontSize: 15,
                    fontWeight: 500,
                    text: 'Password',
                    letterSpacing: -0.55,
                  ),
                ),

                Spacer(),

                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                    left: 35.0,
                    bottom: 10.0,
                    right: 35.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      //func dummy
                    },
                    child: Text(
                      'Lupa?',
                      style: TextStyle(
                        fontFamily: "Jakarta",
                        fontSize: 15,
                        color: Color.fromARGB(255, 52, 103, 100),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: 35, right: 35, bottom: 10),
              child: LoginPasswordTf(
                txtController: controller.txtPassword,
                theHint: "Password",
                icon: Icons.lock_outline,
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 30, bottom: 8),
              alignment: Alignment.topLeft,
              child: CustomCheckbox(label: 'Ingat saya'),
            ),

            LoginFormBtn(),

            Container(
              padding: EdgeInsets.only(top: 10),
              child: HeadertextLoginForm(
                color: Color.fromARGB(255,116,119,126),
                fontSize: 17,
                fontWeight: 500,
                text: "ATAU",
                letterSpacing: 1.5,
              ),
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35),
                  width: 180,
                  height: 60,

                  child: Expanded(
                    child: LoginBtnAlt(
                      onPressed: () {
                        //func
                      },
                      image: Image.asset('image/google_icon.png'),
                      text: "Google",
                    ),
                  ),
                ),

                Spacer(),

                Container(
                  padding: EdgeInsets.only(right: 35),
                  width: 180,
                  height: 60,

                  child: Expanded(
                    child: LoginBtnAlt(
                      onPressed: () {
                        //func
                      },
                      image: Image.asset('image/email_icon.png'),
                      text: "Email",
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadertextLoginForm(
                  color: Color.fromARGB(255, 61, 74, 66),
                  fontSize: 15,
                  fontWeight: 15,
                  text: "Tidak punya akun?",
                  letterSpacing: -0.55,
                ),

                InkWell(
                  child: Text(
                    " Daftar",
                    style: TextStyle(
                      color: Color.fromARGB(255, 52, 103, 100),
                      fontFamily: "Jakarta",
                      fontSize: 15,
                      fontWeight: FontWeight(500),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Container(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  overlayColor: Color.fromARGB(255, 61, 74, 66),
                  backgroundColor: Color.fromARGB(255, 237, 254, 254),
                ),
                onPressed: () {
                  //func
                },
                icon: Container(
                  width: 20,
                  height: 20,
                  child: Image.asset("image/graduate_cap.png"),
                ),
                label: Text(
                  "Masuk Sebagai Admin",
                  style: TextStyle(
                    fontFamily: "Jakarta",
                    fontSize: 15,
                    fontWeight: FontWeight(500),
                    color: Color.fromARGB(255, 52, 103, 100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
