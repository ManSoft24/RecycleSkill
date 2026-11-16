import 'package:flutter/material.dart';

class WasteSummaryBottomBar extends StatelessWidget {
  final int selectedCount;
  final double totalWeight;
  final int estimatedSaldo;
  final int ecoPoints;
  final VoidCallback onContinuePickup;

  const WasteSummaryBottomBar({
    super.key,
    required this.selectedCount,
    required this.totalWeight,
    required this.estimatedSaldo,
    required this.ecoPoints,
    required this.onContinuePickup,
  });

  String _formatCurrency(int amount) {
    final str = amount.toString();
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final formatted = str.replaceAllMapped(reg, (Match m) => '${m[1]}.');
    return 'Rp$formatted';
  }

  String _formatWeight(double weight) {
    final isInt = weight % 1 == 0;
    return isInt ? weight.toInt().toString() : weight.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
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
            // Summary Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Details
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F5EE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.recycling_rounded,
                            color: Color(0xFF006948),
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$selectedCount Jenis Terpilih',
                                    style: const TextStyle(
                                      fontFamily: 'Jakarta',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF131B2E),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '  •  ',
                                    style: TextStyle(
                                      fontFamily: 'Jakarta',
                                      fontSize: 11,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Estimasi Berat ${_formatWeight(totalWeight)} Kg',
                                    style: const TextStyle(
                                      fontFamily: 'Jakarta',
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF3D4A42),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.stars_rounded,
                                  size: 14,
                                  color: Color(0xFFA36700),
                                ),
                                const SizedBox(width: 3),
                                Flexible(
                                  child: Text(
                                    '+$ecoPoints Poin Eco Kudus',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Jakarta',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFA36700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // Right: Saldo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Estimasi Saldo',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3D4A42),
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      _formatCurrency(estimatedSaldo),
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF006948),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Continue CTA Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: selectedCount > 0 ? onContinuePickup : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006948),
                  disabledBackgroundColor: const Color(0xFF94A3B8),
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
                        'Lanjutkan Pilihan Pickup',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
