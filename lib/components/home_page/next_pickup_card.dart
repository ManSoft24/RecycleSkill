import 'package:flutter/material.dart';

class NextPickupCard extends StatelessWidget {
  final String sectionTitle;
  final String activeCountLabel;
  final String scheduleLabel;
  final String statusPillText;
  final String pointName;
  final String pointAddress;
  final String dateTimeText;
  final String ctaText;
  final VoidCallback? onCtaTap;

  const NextPickupCard({
    super.key,
    this.sectionTitle = 'Pickup Berikutnya',
    this.activeCountLabel = '1 Aktif',
    this.scheduleLabel = 'Jadwal Setor Terdekat',
    this.statusPillText = 'Menunggu Jadwal',
    this.pointName = 'Pickup Point Gebog 01 — Balai Desa Gondosari',
    this.pointAddress = 'Jl. Raya Gondosari, Gebog, Kudus',
    this.dateTimeText = 'Kamis, 15 Okt 2026 • 08.00–10.00 WIB',
    this.ctaText = 'Lihat Tiket & QR Code',
    this.onCtaTap,
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
                sectionTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              activeCountLabel,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF059669),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFF3F4F6),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD1FAE5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.calendar_month_rounded,
                            size: 20,
                            color: Color(0xFF047857),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            scheduleLabel,
                            style: const TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      statusPillText,
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF92400E),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Color(0xFF1E40AF),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pointName,
                            style: const TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            pointAddress,
                            style: const TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    dateTimeText,
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onCtaTap ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE0E7FF),
                    foregroundColor: const Color(0xFF1E40AF),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.qr_code_rounded, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        ctaText,
                        style: const TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
