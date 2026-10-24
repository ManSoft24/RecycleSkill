import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final String title;
  final String descriptionPrefix;
  final String highlightText;
  final int totalDots;
  final int activeDotIndex;
  final VoidCallback? onTap;

  const HeroBanner({
    super.key,
    this.title = 'Harga Sampah Terstandar',
    this.descriptionPrefix =
        'Tips cuan: Sampah bersih, terpilah & kering dapat ',
    this.highlightText = 'bonus nilai +10%',
    this.totalDots = 3,
    this.activeDotIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF14B8A6), // teal-500
                  Color(0xFF047857), // emerald-700
                  Color(0xFF064E3B), // emerald-900
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF047857).withAlpha(60),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -16,
                  child: Icon(
                    Icons.eco_rounded,
                    size: 96,
                    color: Colors.white.withAlpha(35),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFFE6FFFA),
                        ),
                        children: [
                          TextSpan(text: descriptionPrefix),
                          TextSpan(
                            text: highlightText,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFDE047),
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
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalDots, (index) {
            final bool isActive = index == activeDotIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isActive
                    ? const Color(0xFF10B981)
                    : const Color(0xFFD1D5DB),
              ),
            );
          }),
        ),
      ],
    );
  }
}
