import 'package:flutter/material.dart';

class HeadertextLoginForm extends StatelessWidget {
  final double fontSize;
  final String text;
  final int fontWeight;

  HeadertextLoginForm({
    super.key,
    required this.fontSize,
    required this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          letterSpacing: -0.55,
          fontFamily: "Jakarta",
          fontSize: fontSize,
          fontWeight: FontWeight(fontWeight),
          color: Color.fromARGB(255, 61, 74, 66),
        ),
      ),
    );
  }
}
