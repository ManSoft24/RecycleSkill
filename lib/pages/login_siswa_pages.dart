import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recycle_skill/components/login_form/custom_check_box.dart';
import 'package:recycle_skill/components/login_form/headertext_login_form.dart';
import 'package:recycle_skill/components/login_form/login_btn_alt.dart';
import 'package:recycle_skill/components/login_form/login_loginform_btn.dart';
import 'package:recycle_skill/components/login_form/login_form_tf.dart';
import 'package:recycle_skill/components/login_form/login_password_tf.dart';

class LoginSiswaPages extends StatelessWidget {
  final RxBool isChecked = false.obs;

  LoginSiswaPages({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtUsername = TextEditingController();
    TextEditingController txtPassword = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),

            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('image/recycleskill_icon.png'),
                height: 70,
                width: 95,
                fit: BoxFit.fill,
              ),
            ),

            Container(
              alignment: Alignment.center,

              padding: EdgeInsets.only(top: 3.0, bottom: 5.0),
              child: HeadertextLoginForm(
                fontSize: 24.5,
                fontWeight: 700,
                text: "Selamat Datang",
                letterSpacing: -0.55,
              ),
            ),

            Container(
              alignment: Alignment.center,

              child: HeadertextLoginForm(
                fontSize: 15,
                fontWeight: 500,
                text: 'Masuk ke akun konsumen Anda',
                letterSpacing: -0.55,
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 35.0, top: 20.0, bottom: 10.0),
              child: HeadertextLoginForm(
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
                txtController: txtUsername,
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
                    fontSize: 15,
                    fontWeight: 500,
                    text: 'Password',
                    letterSpacing: -0.55,
                  ),
                ),

                SizedBox(width: 150),

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
                txtController: txtPassword,
                theHint: "Password",
                icon: Icons.lock_outline,
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: Obx(
                () => CustomCheckbox(
                  label: 'Ingat saya',
                  value: isChecked.value,
                  onChanged: (newValue) {
                    isChecked.value = newValue ?? false;
                  },
                ),
              ),
            ),

            LoginFormBtn(),

            Container(
              padding: EdgeInsets.only(top: 10),
              child: HeadertextLoginForm(
                fontSize: 15,
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
