import 'package:flutter/material.dart';
import 'package:recycle_skill/models/tukar_sampah/waste_catalog_item.dart';

class WasteItemCard extends StatelessWidget {
  final WasteCatalogItem item;
  final double quantity;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;

  const WasteItemCard({
    super.key,
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onSubtract,
  });

  String _formatCurrency(int amount) {
    final str = amount.toString();
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final formatted = str.replaceAllMapped(reg, (Match m) => '${m[1]}.');
    return 'Rp $formatted';
  }

  String _formatQuantity(double qty) {
    final isInt = qty % 1 == 0;
    final qtyStr = isInt ? qty.toInt().toString() : qty.toString();
    final unitClean = item.unit.replaceAll('/', '').trim();
    return '$qtyStr $unitClean';
  }

  Widget _buildBadge() {
    if (item.badgeText == null) return const SizedBox.shrink();

    switch (item.badgeType) {
      case WasteBadgeType.trend:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.trending_up_rounded,
              size: 14,
              color: Color(0xFF006948),
            ),
            const SizedBox(width: 3),
            Text(
              item.badgeText!,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF006948),
              ),
            ),
          ],
        );
      case WasteBadgeType.popular:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
          decoration: BoxDecoration(
            color: const Color(0xFF99EFE5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            item.badgeText!,
            style: const TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF006F67),
            ),
          ),
        );
      case WasteBadgeType.high:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF4D9),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            item.badgeText!,
            style: const TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA36700),
            ),
          ),
        );
      case WasteBadgeType.biofuel:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
          decoration: BoxDecoration(
            color: const Color(0xFFFFDDB8),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            item.badgeText!,
            style: const TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2A1700),
            ),
          ),
        );
      case WasteBadgeType.none:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFF1F5F9),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Image & Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 64,
                  height: 64,
                  color: const Color(0xFFF2F3FF),
                  child: Image.asset(
                    item.imagePath,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(
                        Icons.recycling_rounded,
                        color: Color(0xFF006948),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tags row
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F3FF),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.categoryTag,
                            style: const TextStyle(
                              fontFamily: 'Jakarta',
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3D4A42),
                            ),
                          ),
                        ),
                        if (item.badgeText != null) _buildBadge(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF131B2E),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF64748B),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 10),

          // Bottom Row: Price & Quantity / Add
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: _formatCurrency(item.pricePerUnit),
                        style: const TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF006948),
                        ),
                      ),
                      TextSpan(
                        text: ' ${item.unit}',
                        style: const TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Action: Stepper vs Tambah Button
              if (quantity > 0)
                Container(
                  height: 36,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEDFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: onSubtract,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.remove_rounded,
                            size: 16,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _formatQuantity(quantity),
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onAdd,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF006948),
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF006948).withValues(alpha: 0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                GestureDetector(
                  onTap: onAdd,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD8F3E5),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          size: 16,
                          color: Color(0xFF006948),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Tambah',
                          style: TextStyle(
                            fontFamily: 'Jakarta',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF006948),
                          ),
                        ),
                      ],
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
