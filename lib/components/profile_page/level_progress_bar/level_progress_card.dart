import 'package:flutter/material.dart';
import 'package:recycle_skill/components/profile_page/level_progress_bar/level_progres_header.dart';
import 'package:recycle_skill/components/profile_page/level_progress_bar/level_progress_bar.dart';
import 'package:recycle_skill/components/profile_page/level_progress_bar/level_progress_footer.dart';


class LevelProgressCard extends StatelessWidget {
  final String currentLevel;
  final int nextLevel;
  final int currentPoints;
  final int maxPoints;

  LevelProgressCard({
    Key? key,
    required this.currentLevel,
    required this.nextLevel,
    required this.currentPoints,
    required this.maxPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int safeMax = maxPoints > 0 ? maxPoints : 1;
    final double progressValue = (currentPoints / safeMax).clamp(0.0, 1.0);
    final int percentage = (progressValue * 100).toInt();
    final int remainingPoints = (maxPoints - currentPoints).clamp(0, maxPoints);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6FC),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LevelProgressHeader(
            currentLevel: currentLevel,
            percentage: percentage,
            nextLevel: nextLevel,
          ),
          const SizedBox(height: 12.0),
          LevelProgressBar(progress: progressValue),
          const SizedBox(height: 12.0),
          LevelProgressFooter(
            currentPoints: currentPoints,
            maxPoints: maxPoints,
            remainingPoints: remainingPoints,
          ),
        ],
      ),
    );
  }
}
