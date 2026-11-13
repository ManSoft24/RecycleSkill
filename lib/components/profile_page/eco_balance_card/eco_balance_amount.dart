import 'package:flutter/material.dart';

class EcoBalanceAmount extends StatelessWidget {
  final String amount;

  const EcoBalanceAmount({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      amount,
      style: const TextStyle(
        fontFamily: 'Jakarta',
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
    );
  }
}
