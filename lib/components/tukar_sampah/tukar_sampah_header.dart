import 'package:flutter/material.dart';

class TukarSampahHeader extends StatelessWidget {
  const TukarSampahHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Tukar Sampah',
                style: TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF131B2E),
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5EE),
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(
                  color: const Color(0xFF006948),
                  width: 1.0,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_outlined,
                    size: 14,
                    color: Color(0xFF006948),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Kudus Hijau',
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF006948),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Pilih jenis sampah terpilah untuk disetor & ditukar saldo',
          style: TextStyle(
            fontFamily: 'Jakarta',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF3D4A42),
          ),
        ),
      ],
    );
  }
}
