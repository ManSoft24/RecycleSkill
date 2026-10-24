import 'package:flutter/material.dart';
import 'package:recycle_skill/components/custom_app_bar.dart';
import 'package:recycle_skill/components/home_page/article_tip_card.dart';
import 'package:recycle_skill/components/home_page/hero_banner.dart';
import 'package:recycle_skill/components/home_page/location_header.dart';
import 'package:recycle_skill/components/home_page/marketplace_catalog.dart';
import 'package:recycle_skill/components/home_page/next_pickup_card.dart';
import 'package:recycle_skill/components/home_page/promo_action_card.dart';
import 'package:recycle_skill/components/home_page/quick_action_grid.dart';
import 'package:recycle_skill/components/home_page/section_header.dart';
import 'package:recycle_skill/components/home_page/waste_price_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            LocationHeader(),
            SizedBox(height: 16),
            HeroBanner(),
            SizedBox(height: 20),
            QuickActionGrid(),
            SizedBox(height: 22),
            PromoActionCard(),
            SizedBox(height: 24),
            NextPickupCard(),
            SizedBox(height: 24),
            WastePriceGrid(),
            SizedBox(height: 24),
            SectionHeader(
              title: 'Belanja Pakai Saldo Sampah',
              actionLabel: 'Lihat Semua',
            ),
            SizedBox(height: 12),
            MarketplaceCatalog(),
            SizedBox(height: 24),
            SectionHeader(
              title: 'Tips Daur Ulang',
              actionLabel: 'Edukasi Warga',
            ),
            SizedBox(height: 12),
            ArticleTipCard(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}