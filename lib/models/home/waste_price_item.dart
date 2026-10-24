import 'package:flutter/material.dart';

class WastePriceItem {
  final String name;
  final String price;
  final String? changeLabel;
  final bool isUp;
  final Color iconColor;
  final IconData icon;

  const WastePriceItem({
    required this.name,
    required this.price,
    this.changeLabel,
    this.isUp = false,
    required this.iconColor,
    required this.icon,
  });
}
