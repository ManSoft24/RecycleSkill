import 'package:flutter/material.dart';

class PickupStickyBottomBar extends StatelessWidget {
  final String pointName;
  final String dateTimeText;
  final String districtTag;
  final VoidCallback onContinueConfirmation;

  const PickupStickyBottomBar({
    super.key,
    required this.pointName,
    required this.dateTimeText,
    this.districtTag = 'Gebog',
    required this.onContinueConfirmation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Summary Strip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 15,
                        color: Color(0xFF006948),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          pointName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '•',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          dateTimeText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3D4A42),
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
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF85F8C4),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    districtTag,
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF002114),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // CTA Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onContinueConfirmation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006948),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color(0xFF006948).withValues(alpha: 0.35),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'Lanjut ke Konfirmasi Penukaran',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
