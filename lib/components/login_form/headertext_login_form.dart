import 'package:flutter/material.dart';

class HeadertextLoginForm extends StatelessWidget {
  final double fontSize;
  final String text;
  final int fontWeight;
  final double letterSpacing;
  final Color color;

  HeadertextLoginForm({
    super.key,
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.letterSpacing,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          letterSpacing: letterSpacing,
          fontFamily: "Jakarta",
          fontSize: fontSize,
          fontWeight: FontWeight(fontWeight),
          color: color,
        ),
      ),
    );
  }
}
