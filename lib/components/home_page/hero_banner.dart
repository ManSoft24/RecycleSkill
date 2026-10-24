import 'dart:async';
import 'package:flutter/material.dart';

class HeroBannerData {
  final String title;
  final String descriptionPrefix;
  final String highlightText;
  final IconData backgroundIcon;
  final List<Color> gradientColors;
  final VoidCallback? onTap;

  const HeroBannerData({
    required this.title,
    required this.descriptionPrefix,
    required this.highlightText,
    this.backgroundIcon = Icons.eco_rounded,
    this.gradientColors = const [
      Color(0xFF14B8A6),
      Color(0xFF047857),
      Color(0xFF064E3B),
    ],
    this.onTap,
  });
}

class HeroBanner extends StatefulWidget {
  final List<HeroBannerData>? banners;
  final Duration autoScrollDuration;

  const HeroBanner({
    super.key,
    this.banners,
    this.autoScrollDuration = const Duration(seconds: 4),
  });

  static const List<HeroBannerData> defaultBanners = [
    HeroBannerData(
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
    HeroBannerData(
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
    HeroBannerData(
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
  ];

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  late final PageController _pageController;
  Timer? _timer;
  int _currentIndex = 0;

  List<HeroBannerData> get _items =>
      widget.banners ?? HeroBanner.defaultBanners;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer?.cancel();
    if (_items.length <= 1) return;
    _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (!mounted) return;
      final nextIndex = (_currentIndex + 1) % _items.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = _items;

    return Column(
      children: [
        SizedBox(
          height: 124,
          child: PageView.builder(
            controller: _pageController,
            itemCount: list.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = list[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: GestureDetector(
                  onTap: item.onTap,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: item.gradientColors,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: item.gradientColors[1].withAlpha(60),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -10,
                          bottom: -22,
                          child: Icon(
                            item.backgroundIcon,
                            size: 96,
                            color: Colors.white.withAlpha(35),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Jakarta',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'Jakarta',
                                  fontSize: 13,
                                  height: 1.4,
                                  color: Color(0xFFE6FFFA),
                                ),
                                children: [
                                  TextSpan(text: item.descriptionPrefix),
                                  TextSpan(
                                    text: item.highlightText,
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
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(list.length, (index) {
            final bool isActive = index == _currentIndex;
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: AnimatedContainer(
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
              ),
            );
          }),
        ),
      ],
    );
  }
}
