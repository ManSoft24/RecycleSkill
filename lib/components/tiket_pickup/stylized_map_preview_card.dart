import 'package:flutter/material.dart';
import 'package:recycle_skill/models/tiket_pickup/pickup_point_model.dart';

class StylizedMapPreviewCard extends StatelessWidget {
  final List<PickupPointModel> points;
  final PickupPointModel selectedPoint;
  final ValueChanged<String> onSelectPoint;
  final VoidCallback? onOpenRoute;

  const StylizedMapPreviewCard({
    super.key,
    required this.points,
    required this.selectedPoint,
    required this.onSelectPoint,
    this.onOpenRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Map Canvas Section
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Stack(
              children: [
                // Road & contour illustration background
                Positioned.fill(
                  child: Image.asset(
                    'image/map_gebog_roads.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFEEF2FF),
                    ),
                  ),
                ),

                // Top Floating Status Pills
                Positioned(
                  top: 12,
                  left: 14,
                  right: 14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Active Drops Pill
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.94),
                            borderRadius: BorderRadius.circular(9999),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF006948),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Flexible(
                                child: Text(
                                  '3 Titik Drop Aktif',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Jakarta',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF131B2E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Location Area Pill
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.94),
                            borderRadius: BorderRadius.circular(9999),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.my_location_rounded,
                                size: 11,
                                color: Color(0xFF006948),
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  'Jl. Rahtawu RT 02',
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
                      ),
                    ],
                  ),
                ),

                // User Location Pin ("Kamu")
                Positioned(
                  left: 75,
                  top: 75,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFF006A63),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person_rounded,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF283044),
                          borderRadius: BorderRadius.circular(9999),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.12),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Kamu',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEEF0FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Pickup Point Pins
                ...points.map((p) {
                  final isSelected = p.id == selectedPoint.id;

                  return Positioned(
                    left: p.id == 'gebog_01'
                        ? 160
                        : p.id == 'gebog_02'
                            ? 250
                            : 30,
                    top: p.id == 'gebog_01'
                        ? 60
                        : p.id == 'gebog_02'
                            ? 48
                            : 45,
                    child: GestureDetector(
                      onTap: () => onSelectPoint(p.id),
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSelected)
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Pulse glow ring
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF85F8C4).withValues(alpha: 0.45),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                // Main emblem
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF006948),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF006948).withValues(alpha: 0.35),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.recycling_rounded,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFE2E8F0),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.location_on_rounded,
                                  size: 14,
                                  color: Color(0xFF006948),
                                ),
                              ),
                            ),
                          const SizedBox(height: 3),
                          // Label
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2.5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9999),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF006948)
                                    : const Color(0xFFE2E8F0),
                                width: isSelected ? 1.5 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                              p.id == 'gebog_01'
                                  ? 'Gebog 01 (${p.distanceKm} km)'
                                  : '${p.village} ${p.distanceKm} km',
                              style: TextStyle(
                                fontFamily: 'Jakarta',
                                fontSize: 10,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: isSelected
                                    ? const Color(0xFF006948)
                                    : const Color(0xFF131B2E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Bottom Route & Distance Info Strip
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1F4E6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.directions_walk_rounded,
                            size: 20,
                            color: Color(0xFF002114),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${selectedPoint.distanceKm.toString().replaceAll('.', ',')} km dari posisimu',
                              style: const TextStyle(
                                fontFamily: 'Jakarta',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF131B2E),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '± ${selectedPoint.estimatedMinutes} menit berkendara ${selectedPoint.routeNote}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Jakarta',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF3D4A42),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // Button "Buka Rute"
                GestureDetector(
                  onTap: onOpenRoute,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5EE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Buka Rute',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF006948),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_outward_rounded,
                          size: 13,
                          color: Color(0xFF006948),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
