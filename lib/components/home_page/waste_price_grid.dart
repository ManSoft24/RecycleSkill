import 'package:flutter/material.dart';

class WastePriceItem {
  final String name;
  final String price;
  final String? changeLabel; // e.g. "^ +Rp 200" or "Stabil"
  final bool isUp;
  final Color iconColor;
  final IconData icon;

  const WastePriceItem({
    required this.name,
    required this.price,
    this.changeLabel,
    this.isUp = false,
    required this.iconColor,
    required this.icon,
  });
}

class WastePriceGrid extends StatelessWidget {
  final String sectionTitle;
  final String verifiedLabel;
  final List<WastePriceItem> items;

  const WastePriceGrid({
    super.key,
    this.sectionTitle = 'Harga Sampah Hari Ini',
    this.verifiedLabel = 'Terverifikasi Gebog',
    this.items = WastePriceGrid.defaultItems,
  });

  static const List<WastePriceItem> defaultItems = [
    WastePriceItem(
      name: 'Botol PET Bening',
      price: 'Rp 4.500/kg',
      changeLabel: '^ +Rp 200',
      isUp: true,
      iconColor: Color(0xFF67E8F9),
      icon: Icons.local_drink_outlined,
    ),
    WastePriceItem(
      name: 'Kardus Bekas',
      price: 'Rp 14.000/kg',
      changeLabel: 'Stabil',
      isUp: false,
      iconColor: Color(0xFFFCD34D),
      icon: Icons.inventory_2_outlined,
    ),
    WastePriceItem(
      name: 'Plastik HDPE',
      price: 'Rp 3.500/kg',
      changeLabel: '^ +Rp 100',
      isUp: true,
      iconColor: Color(0xFF86EFAC),
      icon: Icons.water_drop_outlined,
    ),
    WastePriceItem(
      name: 'Karet Lampu',
      price: 'Rp 2.000/kg',
      changeLabel: 'Stabil',
      isUp: false,
      iconColor: Color(0xFFC4B5FD),
      icon: Icons.lightbulb_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF059669),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      sectionTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              verifiedLabel,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF059669),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => _buildCard(context, items[index]),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, WastePriceItem item) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: item.iconColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    item.icon,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: item.isUp
                      ? const Color(0xFFD1FAE5)
                      : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item.changeLabel ?? '',
                  style: TextStyle(
                    fontFamily: 'Jakarta',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: item.isUp
                        ? const Color(0xFF047857)
                        : const Color(0xFF6B7280),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4B5563),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.price,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
