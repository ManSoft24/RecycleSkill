import 'package:flutter/material.dart';
import 'package:recycle_skill/components/profile_page/circular_services/circular_service_menu_item.dart';
import 'package:recycle_skill/models/circular_service_item_model.dart';
import 'package:recycle_skill/routes.dart';

class CircularServicesSection extends StatelessWidget {
  final List<CircularServiceItemModel> items;

  const CircularServicesSection({super.key, this.items = defaultItems});

  static const List<CircularServiceItemModel> defaultItems = [
    CircularServiceItemModel(
      title: 'Kursus Saya',
      subtitle: '2 kursus aktif & sertifikat terbit',
      icon: Icons.school_outlined,
      iconContainerColor: Color(0xFF85F8C4),
      iconColor: Color(0xFF006C4C),
      route: Routes.kursus,
    ),
    CircularServiceItemModel(
      title: 'Riwayat Transaksi & UMKM',
      subtitle: 'Pesanan pot daur ulang & setoran',
      icon: Icons.receipt_long_outlined,
      iconContainerColor: Color(0xFF99EFE5),
      iconColor: Color(0xFF006C4C),
      route: Routes.riwayat_transaksi,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Layanan & Akun Sirkular',
          style: TextStyle(
            fontFamily: 'Jakarta',
            color: Color(0xFF111827),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                blurRadius: 10.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularServiceMenuItem(
                    item: item,
                    showDivider: index < items.length - 1,
                  ),
                  if (index < items.length - 1)
                    const Divider(
                      height: 1,
                      thickness: 0.8,
                      indent: 72,
                      endIndent: 14,
                      color: Color(0xFFF3F4F6),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
