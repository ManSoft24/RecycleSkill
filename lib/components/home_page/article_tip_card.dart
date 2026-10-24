import 'package:flutter/material.dart';

class ArticleTipCard extends StatelessWidget {
  final String title;
  final String readTimeBadge;
  final String category;
  final String? imagePath;
  final String fallbackImagePath;
  final VoidCallback? onTap;

  const ArticleTipCard({
    super.key,
    this.title =
        '3 Cara Mudah Pilah Botol PET agar Dihargai Maksimal Saat Disetor',
    this.readTimeBadge = '3 Menit Baca',
    this.category = 'Panduan Harga',
    this.imagePath,
    this.fallbackImagePath = 'image/dummy_placeholder.png',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 68,
                height: 68,
                child: Image.asset(
                  imagePath ?? fallbackImagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFF3F4F6),
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 24,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCFFAFE), // cyan-100
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          readTimeBadge,
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0E7490), // cyan-700
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.chevron_right_rounded,
              size: 22,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}
