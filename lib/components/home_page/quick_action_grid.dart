import 'package:flutter/material.dart';

class QuickActionItem {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const QuickActionItem({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.onTap,
  });
}

class QuickActionGrid extends StatelessWidget {
  final List<QuickActionItem>? items;

  const QuickActionGrid({super.key, this.items});

  static List<QuickActionItem> defaultItems = const [
    QuickActionItem(
      label: 'Tukar Sampah',
      icon: Icons.recycling_rounded,
      backgroundColor: Color(0xFFD1FAE5), // mint
      iconColor: Color(0xFF047857),
    ),
    QuickActionItem(
      label: 'Pickup Point',
      icon: Icons.location_on_outlined,
      backgroundColor: Color(0xFFE0F2FE), // cyan/ice blue
      iconColor: Color(0xFF0284C7),
    ),
    QuickActionItem(
      label: 'Marketplace',
      icon: Icons.storefront_outlined,
      backgroundColor: Color(0xFFFFEDD5), // light peach
      iconColor: Color(0xFFEA580C),
    ),
    QuickActionItem(
      label: 'Aktivitas',
      icon: Icons.history_rounded,
      backgroundColor: Color(0xFFEDE9FE), // light purple
      iconColor: Color(0xFF7C3AED),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final list = items ?? defaultItems;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list.map((item) {
        return Expanded(
          child: GestureDetector(
            onTap: item.onTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: item.backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      item.icon,
                      size: 26,
                      color: item.iconColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    fontFamily: 'Jakarta',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
