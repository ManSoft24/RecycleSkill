import 'package:flutter/material.dart';
import 'package:recycle_skill/models/tiket_pickup/pickup_point_model.dart';

class PickupDatetimePickerCard extends StatelessWidget {
  final List<PickupDateSlot> dateSlots;
  final String selectedDateId;
  final ValueChanged<String> onSelectDate;
  final List<PickupTimeSlot> timeSlots;
  final String selectedTimeId;
  final ValueChanged<String> onSelectTime;

  const PickupDatetimePickerCard({
    super.key,
    required this.dateSlots,
    required this.selectedDateId,
    required this.onSelectDate,
    required this.timeSlots,
    required this.selectedTimeId,
    required this.onSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Hari & Jam Kedatangan',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF131B2E),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Pilih slot kedatangan untuk menghindari antrean penimbangan.',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3D4A42),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5EE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 18,
                    color: Color(0xFF006948),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Date Options
          const Text(
            'TANGGAL PENGUMPULAN',
            style: TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF64748B),
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: dateSlots.map((d) {
              final isSelected = d.id == selectedDateId;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () => onSelectDate(d.id),
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF006948)
                            : const Color(0xFFEAEDFF),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF006948).withValues(alpha: 0.25),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            d.badgeText,
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF3D4A42),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            d.dateText,
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF131B2E),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            d.dayName,
                            style: TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? Colors.white.withValues(alpha: 0.9)
                                  : const Color(0xFF3D4A42),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Time Slots
          const Text(
            'SLOT WAKTU KEDATANGAN',
            style: TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF64748B),
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: timeSlots.map((t) {
              final isSelected = t.id == selectedTimeId;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () => onSelectTime(t.id),
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF006948)
                            : const Color(0xFFEAEDFF),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF006948).withValues(alpha: 0.25),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF3D4A42),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              t.timeRange,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Jakarta',
                                fontSize: 11.5,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF131B2E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 14),

          // Eco Reward Reminder Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFD1F4E6),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF85F8C4),
                width: 1,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.stars_rounded,
                  size: 18,
                  color: Color(0xFF006948),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Dapatkan bonus +150 Poin Eco untuk penyetoran tepat waktu pada slot pagi!',
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF002114),
                      height: 1.3,
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
