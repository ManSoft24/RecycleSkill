import 'package:flutter/material.dart';
import 'package:recycle_skill/components/profile_page/green_contribution/contribution_stat_card.dart';

class GreenContributionSection extends StatelessWidget {
  final double collectedWasteKg;
  final int savedTrees;
  final double co2Reduction;
  final String yearLabel;

  const GreenContributionSection({
    super.key,
    required this.collectedWasteKg,
    required this.savedTrees,
    required this.co2Reduction,
    this.yearLabel = 'Tahun 2025',
  });

  String _formatDecimal(double val) {
    if (val == val.truncateToDouble()) {
      return val.toInt().toString();
    }
    return val.toStringAsFixed(1).replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Kontribusi Hijau Saya',
              style: TextStyle(
                fontFamily: 'Jakarta',
                color: Color(0xFF111827),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: const Color(0xFFDBE6E8),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                yearLabel,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  color: Color(0xFF006948),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),

        Row(
          children: [
            Expanded(
              child: ContributionStatCard(
                icon: Icons.delete_outline_rounded,
                value: _formatDecimal(collectedWasteKg),
                unit: 'Kg',
                label: 'Sampah Terkumpul',
              ),
            ),
            const SizedBox(width: 8.0),

            Expanded(
              child: ContributionStatCard(
                icon: Icons.park_outlined,
                value: savedTrees.toString(),
                unit: 'Pohon',
                label: 'Hidup Terselamatkan',
              ),
            ),
            const SizedBox(width: 8.0),

            Expanded(
              child: ContributionStatCard(
                icon: Icons.cloud_outlined,
                value: _formatDecimal(co2Reduction),
                unit: 'Kg',
                label: 'CO₂ Karbon Ditekan',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
