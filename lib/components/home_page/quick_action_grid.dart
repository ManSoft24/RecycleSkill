import 'package:flutter/material.dart';
import 'package:recycle_skill/models/home/quick_action_item.dart';

export 'package:recycle_skill/models/home/quick_action_item.dart';

class QuickActionGrid extends StatelessWidget {
  final List<QuickActionItem> items;
  final Function(QuickActionItem item)? onItemTap;

  const QuickActionGrid({
    super.key,
    required this.items,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onItemTap?.call(item),
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
