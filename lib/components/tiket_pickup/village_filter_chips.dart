import 'package:flutter/material.dart';

class VillageFilterChips extends StatelessWidget {
  final List<String> villages;
  final String selectedVillage;
  final ValueChanged<String> onSelectVillage;

  const VillageFilterChips({
    super.key,
    required this.villages,
    required this.selectedVillage,
    required this.onSelectVillage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: villages.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final village = villages[index];
          final isSelected = village == selectedVillage;

          return GestureDetector(
            onTap: () => onSelectVillage(village),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF006948) : Colors.white,
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF006948)
                      : const Color(0xFFE2E8F0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected) ...[
                    const Icon(
                      Icons.check_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                  ],
                  Text(
                    village,
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : const Color(0xFF3D4A42),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
