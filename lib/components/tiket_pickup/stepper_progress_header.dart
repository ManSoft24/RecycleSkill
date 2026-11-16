import 'package:flutter/material.dart';

class StepperProgressHeader extends StatelessWidget {
  final String stepText;
  final String percentageText;
  final double progress;

  const StepperProgressHeader({
    super.key,
    this.stepText = 'LANGKAH 2 DARI 3 • PILIH TITIK & WAKTU',
    this.percentageText = '65% Selesai',
    this.progress = 0.65,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                stepText,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF006948),
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              percentageText,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3D4A42),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFEAEDFF),
            borderRadius: BorderRadius.circular(9999),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 6,
                  width: constraints.maxWidth * progress.clamp(0.0, 1.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF006948),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
