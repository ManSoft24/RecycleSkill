import 'package:flutter/material.dart';
import 'package:recycle_skill/components/login_form/headertext_login_form.dart';

class LoginBtnAlt extends StatelessWidget {
  final String text;
  final Image image;

  LoginBtnAlt({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 180,
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: BorderSide(width: 0.1,color: Colors.black),
            ),
          ),
          onPressed: () {
            //func fummy
          },
          icon: Container(
            width: 20,
            height: 20,
            child: image,
          ),
          label: HeadertextLoginForm(
            fontSize: 15,
            fontWeight: 500,
            text: text,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}
