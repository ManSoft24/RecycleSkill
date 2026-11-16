import 'package:flutter/material.dart';
import 'package:recycle_skill/models/tiket_pickup/pickup_point_model.dart';

class PickupPointCard extends StatelessWidget {
  final PickupPointModel point;
  final bool isSelected;
  final VoidCallback onTap;

  const PickupPointCard({
    super.key,
    required this.point,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF006948)
                : const Color(0xFFE2E8F0),
            width: isSelected ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF006948).withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Badges & Selection Indicator
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (point.isRecommended)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF006948),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'REKOMENDASI',
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: point.isRecommended
                              ? const Color(0xFF85F8C4)
                              : const Color(0xFFEAEDFF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${point.distanceKm} km dari lokasimu',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: point.isRecommended
                                ? const Color(0xFF002114)
                                : const Color(0xFF3D4A42),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF006948)
                        : const Color(0xFFF1F5F9),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF006948)
                          : const Color(0xFFCBD5E1),
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? const Center(
                          child: Icon(
                            Icons.check_rounded,
                            size: 14,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Title
            Text(
              point.name,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF131B2E),
                height: 1.25,
              ),
            ),

            const SizedBox(height: 6),

            // Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Color(0xFF6D7A72),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    point.address,
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3D4A42),
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Operational & Status Info Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFF1F5F9),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 13,
                            color: Color(0xFF006948),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Jadwal Operasional',
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3D4A42),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          point.operationalSchedule,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.scale_outlined,
                              size: 13,
                              color: Color(0xFF006A63),
                            ),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                'Status Kapasitas',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Jakarta',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF3D4A42),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: point.capacityStatus.contains('Buka Besok')
                                    ? const Color(0xFF825100)
                                    : const Color(0xFF006948),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                point.capacityStatus,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Jakarta',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: point.capacityStatus.contains('Buka Besok')
                                      ? const Color(0xFF825100)
                                      : const Color(0xFF006948),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            if (point.facilities.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Fasilitas:',
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  ...point.facilities.map(
                    (f) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAEDFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle_outline_rounded,
                            size: 11,
                            color: Color(0xFF006A63),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            f,
                            style: const TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3D4A42),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
