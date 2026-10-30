import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recycle_skill/components/login_form/custom_check_box.dart';
import 'package:recycle_skill/components/login_form/header_login_form.dart';
import 'package:recycle_skill/components/login_form/headertext_login_form.dart';
import 'package:recycle_skill/components/login_form/login_form_tf.dart';
import 'package:recycle_skill/components/login_form/login_loginform_btn.dart';
import 'package:recycle_skill/components/login_form/login_password_tf.dart';
import 'package:recycle_skill/controllers/login_admin_ctr.dart';

class LoginAdminPages extends StatelessWidget {
  final controller = Get.put(LoginAdminCtr());

  LoginAdminPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),

            HeaderLoginForm(
              user: "Access the School Management and \nAnalytics portal.",
              label: 'Admin Dashboard',
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

            LoginFormBtn(
              action: () {
                debugPrint("Tombol LoginFormBtn berhasil ditekan!");
                controller.loginAdmin();
              },
            ),

            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.horizontal_rule_rounded,
                    color: Color.fromARGB(255, 116, 119, 126),
                    size: 30,
                  ),

                  HeadertextLoginForm(
                    fontSize: 17,
                    fontWeight: 500,
                    text: 'SECURITY NOTICE',
                    letterSpacing: 1.5,
                    color: Color.fromARGB(255, 116, 119, 126),
                  ),

                  Icon(
                    Icons.horizontal_rule_rounded,
                    color: Color.fromARGB(255, 116, 119, 126),
                    size: 30,
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20),
              child: HeadertextLoginForm(
                color: Color.fromARGB(255, 61, 74, 66),
                fontSize: 15,
                fontWeight: 500,
                text: 'This access point is for SMK\nadministrative staff. All activities are\nlogged and monitored for\ncompliance.',
                letterSpacing: -0.55,
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 30),
              child: HeadertextLoginForm(
                fontSize: 15,
                fontWeight: 500,
                text: 'Are you a student or parent?',
                letterSpacing: -0.55,
                color: Color.fromARGB(255, 61, 74, 66),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadertextLoginForm(
                      fontSize: 15,
                      fontWeight: 500,
                      text: 'Switch to Consumer Login',
                      letterSpacing: 0,
                      color: Color.fromARGB(255, 19, 44, 74),
                    ),

                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Color.fromARGB(255, 61, 74, 66),
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
