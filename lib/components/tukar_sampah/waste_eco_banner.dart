import 'package:flutter/material.dart';

class WasteEcoBanner extends StatelessWidget {
  const WasteEcoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF006948),
            Color(0xFF097956),
            Color(0xFF064E3B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF006948).withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Circular blur glow on right
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF85F8C4).withValues(alpha: 0.18),
                ),
              ),
            ),
            // Leaf icon watermark on right
            Positioned(
              right: 12,
              bottom: 4,
              child: Icon(
                Icons.energy_savings_leaf_rounded,
                size: 92,
                color: Colors.white.withValues(alpha: 0.15),
              ),
            ),
            // Text Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Harga Sampah Terstandar',
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 310),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 12,
                          color: Colors.white,
                          height: 1.45,
                        ),
                        children: [
                          TextSpan(
                            text: 'Tips cuan: Sampah bersih, terpilah & kering mendapatkan ',
                          ),
                          TextSpan(
                            text: 'bonus nilai +10%',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF85F8C4),
                            ),
                          ),
                          TextSpan(
                            text: ' saat penimbangan kurir!',
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
      ),
    );
  }
}
