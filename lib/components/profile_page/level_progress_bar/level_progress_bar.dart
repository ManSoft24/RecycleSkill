import 'package:flutter/material.dart';

class LevelProgressBar extends StatelessWidget {
  final double progress;

  LevelProgressBar({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 10.0,
        backgroundColor: const Color(0xFFE2E6E9), 
        valueColor: const AlwaysStoppedAnimation<Color>(
          Color(0xFF006C4C), 
        ),
      ),
    );
  }
}
