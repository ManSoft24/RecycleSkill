import 'package:flutter/material.dart';

class PickupPageHeader extends StatelessWidget {
  const PickupPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                size: 13,
                color: Color(0xFF006948),
              ),
              SizedBox(width: 5),
              Text(
                'Resmi DLH Kudus',
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
        const SizedBox(height: 10),
        const Text(
          'Pilih Pickup Point Terdekat',
          style: TextStyle(
            fontFamily: 'Jakarta',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF131B2E),
            letterSpacing: -0.3,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Setor sampah ke titik kumpul Gebog sesuai jadwal.',
          style: TextStyle(
            fontFamily: 'Jakarta',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF3D4A42),
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
