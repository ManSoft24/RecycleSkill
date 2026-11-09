import 'package:flutter/material.dart';

class LevelProgressFooter extends StatelessWidget {
  final int currentPoints;
  final int maxPoints;
  final int remainingPoints;

  const LevelProgressFooter({
    Key? key,
    required this.currentPoints,
    required this.maxPoints,
    required this.remainingPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$currentPoints / $maxPoints Poin Level',
          style: const TextStyle(
            color: Color(0xFF555555),
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
        Text(
          'Tersisa $remainingPoints Poin lagi',
          style: const TextStyle(
            color: Color(0xFF006C4C),
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
