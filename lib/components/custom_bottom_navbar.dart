import 'dart:ui';
import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavbar({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  // Palette
  static const Color activeColor = Color(0xFF1C3125);
  static const Color inactiveColor = Color(0xFF6E7F74);
  static const Color mapIconActiveColor = Color(0xFFA3E4C1);
  static const Color fabStart = Color(0xFF37513F);
  static const Color fabEnd = Color(0xFF1D3126);

  static const double _barHeight = 64.0;
  static const double _fabSize = 58.0;
  static const double _totalHeight = 78.0;

  @override
  Widget build(BuildContext context) {
    final bool isMapActive = activeIndex == 2;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
        child: SizedBox(
          height: _totalHeight,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: _barHeight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_barHeight / 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1C3125).withValues(alpha: 0.10),
                        blurRadius: 22,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.55),
                        blurRadius: 1,
                        offset: const Offset(0, -1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(_barHeight / 2),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_barHeight / 2),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.80),
                            width: 1.3,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFDCEDDE).withValues(alpha: 0.24),
                              Colors.white.withValues(alpha: 0.14),
                              const Color(0xFFF3E9DE).withValues(alpha: 0.20),
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: IgnorePointer(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      _barHeight / 2,
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 0.45, 1.0],
                                      colors: [
                                        Colors.white.withValues(alpha: 0.38),
                                        Colors.white.withValues(alpha: 0.02),
                                        Colors.black.withValues(alpha: 0.03),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                _slot(
                                  index: 0,
                                  icon: Icons.home_rounded,
                                  activeIcon: Icons.home_rounded,
                                ),
                                _slot(
                                  index: 1,
                                  icon: Icons.delete_outline_rounded,
                                  activeIcon: Icons.delete_rounded,
                                ),
                                const Expanded(child: SizedBox()),
                                _slot(
                                  index: 3,
                                  icon: Icons.receipt_long_outlined,
                                  activeIcon: Icons.receipt_long_rounded,
                                ),
                                _slot(
                                  index: 4,
                                  icon: Icons.person_outline_rounded,
                                  activeIcon: Icons.person_rounded,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () => onTap(2),
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: _fabSize,
                    height: _fabSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [fabStart, fabEnd],
                      ),
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1B2E23).withValues(alpha: 0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      child: Icon(
                        Icons.map_rounded,
                        color: isMapActive ? mapIconActiveColor : Colors.white,
                        size: 27,
                        key: ValueKey<bool>(isMapActive),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _slot({
    required int index,
    required IconData icon,
    required IconData activeIcon,
  }) {
    final bool isActive = activeIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: _barHeight,
          child: Center(
            child: Icon(
              isActive ? activeIcon : icon,
              size: 26,
              color: isActive ? activeColor : inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}

