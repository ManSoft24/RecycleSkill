import 'package:flutter/material.dart';
import 'package:recycle_skill/components/login_form/headertext_login_form.dart';

class HeaderLoginForm extends StatelessWidget {
  final String user;
  final String label;

  HeaderLoginForm({super.key, required this.user, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            color: Color.fromARGB(255, 61, 74, 66),
            fontSize: 24.5,
            fontWeight: 700,
            text: label,
            letterSpacing: -0.55,
          ),
        ),

        Container(
          alignment: Alignment.center,

          child: HeadertextLoginForm(
            color: Color.fromARGB(255, 61, 74, 66),
            fontSize: 15,
            fontWeight: 500,
            text: user,
            letterSpacing: -0.55,
          ),
        ),
      ],
    );
  }
}
