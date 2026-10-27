import 'package:flutter/material.dart';
import 'package:recycle_skill/components/login_form/header_login_form.dart';

class LoginAdminPages extends StatelessWidget {
  LoginAdminPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 90),

            HeaderLoginForm(
              user: "Access the School Management and \nAnalytics portal.",
              label: 'Admin Dashboard',
            ),
          ],
        ),
      ),
    );
  }
}
