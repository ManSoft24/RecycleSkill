import 'package:flutter/material.dart';

class PromoActionCard extends StatelessWidget {
  final String overline;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonTap;

  const PromoActionCard({
    super.key,
    this.overline = 'INISIATIF GEBOG BERDAYA',
    this.title = 'Sampahmu Bisa Jadi Saldo Belanja.',
    this.description =
        'Tukar sampah anorganik terpilah di pickup point terdekat. Dapatkan saldo langsung untuk belanja sembako murah di mitra UMKM desa.',
    this.buttonText = 'Tukar Sampah Sekarang →',
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFECFDF5), // pale-mint
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFA7F3D0).withAlpha(120),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFA7F3D0).withAlpha(150),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.energy_savings_leaf_rounded,
                color: Color(0xFF047857),
                size: 28,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overline,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: Color(0xFF047857),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Jakarta',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4B5563),
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonTap ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF065F46),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
