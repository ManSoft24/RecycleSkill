import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:recycle_skill/models/home/hero_banner_data.dart';
import 'package:recycle_skill/models/home/marketplace_product.dart';
import 'package:recycle_skill/models/home/quick_action_item.dart';
import 'package:recycle_skill/models/home/waste_price_item.dart';

class HomeController extends GetxController {
  // Hero Banners
  final RxList<HeroBannerData> heroBanners = <HeroBannerData>[
    const HeroBannerData(
      title: 'Harga Sampah Terstandar',
      descriptionPrefix: 'Tips cuan: Sampah bersih, terpilah & kering dapat ',
      highlightText: 'bonus nilai +10%',
      backgroundIcon: Icons.eco_rounded,
      gradientColors: [
        Color(0xFF14B8A6),
        Color(0xFF047857),
        Color(0xFF064E3B),
      ],
    ),
    const HeroBannerData(
      title: 'Jemput Sampah Gebog',
      descriptionPrefix: 'Setor minimal 5 kg pilahan langsung dapat ',
      highlightText: 'gratis ongkir pickup!',
      backgroundIcon: Icons.local_shipping_rounded,
      gradientColors: [
        Color(0xFF0284C7),
        Color(0xFF0F766E),
        Color(0xFF064E3B),
      ],
    ),
    const HeroBannerData(
      title: 'Tukar Saldo Belanja',
      descriptionPrefix: 'Gunakan saldo sampahmu untuk belanja sembako murah ',
      highlightText: 'diskon s/d 20%',
      backgroundIcon: Icons.storefront_rounded,
      gradientColors: [
        Color(0xFF059669),
        Color(0xFF166534),
        Color(0xFF14532D),
      ],
    ),
  ].obs;

  // Quick Actions
  final RxList<QuickActionItem> quickActions = <QuickActionItem>[
    const QuickActionItem(
      label: 'Tukar Sampah',
      icon: Icons.recycling_rounded,
      backgroundColor: Color(0xFFD1FAE5),
      iconColor: Color(0xFF047857),
    ),
    const QuickActionItem(
      label: 'Pickup Point',
      icon: Icons.location_on_outlined,
      backgroundColor: Color(0xFFE0F2FE),
      iconColor: Color(0xFF0284C7),
    ),
    const QuickActionItem(
      label: 'Marketplace',
      icon: Icons.storefront_outlined,
      backgroundColor: Color(0xFFFFEDD5),
      iconColor: Color(0xFFEA580C),
    ),
    const QuickActionItem(
      label: 'Aktivitas',
      icon: Icons.history_rounded,
      backgroundColor: Color(0xFFEDE9FE),
      iconColor: Color(0xFF7C3AED),
    ),
  ].obs;

  // Waste Prices
  final RxList<WastePriceItem> wastePrices = <WastePriceItem>[
    const WastePriceItem(
      name: 'Botol PET Bening',
      price: 'Rp 4.500/kg',
      changeLabel: '^ +Rp 200',
      isUp: true,
      iconColor: Color(0xFF67E8F9),
      icon: Icons.local_drink_outlined,
    ),
    const WastePriceItem(
      name: 'Kardus Bekas',
      price: 'Rp 14.000/kg',
      changeLabel: 'Stabil',
      isUp: false,
      iconColor: Color(0xFFFCD34D),
      icon: Icons.inventory_2_outlined,
    ),
    const WastePriceItem(
      name: 'Plastik HDPE',
      price: 'Rp 3.500/kg',
      changeLabel: '^ +Rp 100',
      isUp: true,
      iconColor: Color(0xFF86EFAC),
      icon: Icons.water_drop_outlined,
    ),
    const WastePriceItem(
      name: 'Karet Lampu',
      price: 'Rp 2.000/kg',
      changeLabel: 'Stabil',
      isUp: false,
      iconColor: Color(0xFFC4B5FD),
      icon: Icons.lightbulb_outline,
    ),
  ].obs;

  // Marketplace Products
  final RxList<MarketplaceProduct> marketplaceProducts = <MarketplaceProduct>[
    const MarketplaceProduct(
      title: 'Tumbler Stainless 500ml',
      price: 'Rp 45.000',
      rating: 4.9,
      seller: 'Kriya Gondosari',
      imagePath: 'image/dummy_placeholder.png',
    ),
    const MarketplaceProduct(
      title: 'Komposter Bag 20L',
      price: 'Rp 25.000',
      rating: 4.8,
      seller: 'Tani Makmur',
      imagePath: 'image/dummy_placeholder.png',
    ),
  ].obs;
}
