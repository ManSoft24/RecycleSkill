import 'package:flutter/material.dart';

class HeroBannerData {
  final String title;
  final String descriptionPrefix;
  final String highlightText;
  final IconData backgroundIcon;
  final List<Color> gradientColors;

  const HeroBannerData({
    required this.title,
    required this.descriptionPrefix,
    required this.highlightText,
    this.backgroundIcon = Icons.eco_rounded,
    this.gradientColors = const [
      Color(0xFF14B8A6),
      Color(0xFF047857),
      Color(0xFF064E3B),
    ],
  });
}
