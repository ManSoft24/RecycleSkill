
import 'package:flutter/material.dart';

class LevelProgressHeader extends StatelessWidget {
  final String currentLevel;
  final int percentage;
  final int nextLevel;

  LevelProgressHeader({
    Key? key,
    required this.currentLevel,
    required this.percentage,
    required this.nextLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.workspace_premium_outlined, 
              color: Color(0xFF006C4C),
              size: 22,
            ),
            const SizedBox(width: 8.0),
            Text(

              'Level $currentLevel',
              style: const TextStyle(
                color: Color(0xFF006C4C), 
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Text(
          '$percentage% menuju Tk. $nextLevel',
          style: const TextStyle(
            color: Color(0xFF555555), 
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
