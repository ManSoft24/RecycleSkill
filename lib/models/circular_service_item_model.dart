import 'package:flutter/material.dart';

class CircularServiceItemModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconContainerColor;
  final Color iconColor;
  final String route;

  const CircularServiceItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconContainerColor,
    required this.iconColor,
    required this.route,
  });
}
