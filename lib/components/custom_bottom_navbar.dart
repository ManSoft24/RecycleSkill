import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int indexAktif;
  final Function(int) onTap;

  const CustomBottomNavbar({
    super.key,
    required this.indexAktif,
    required this.onTap,
  });

  static const Color hijauGelap = Color(0xFF1F3527);
  static const Color abuAbu = Color(0xFF59655D);
  static const Color hijauLembut = Color(0xFFE2EDE0);
  static const Color kremLembut = Color(0xFFEFE5DA);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SizedBox(
        height: 88,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    hijauLembut.withValues(alpha: 0.92),
                    kremLembut.withValues(alpha: 0.92),
                  ],
                ),
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tombolIkon(0, Icons.home_outlined, Icons.home),
                  tombolIkon(1, Icons.delete_outline, Icons.delete),
                  const SizedBox(width: 58),
                  tombolIkon(
                    3,
                    Icons.receipt_long_outlined,
                    Icons.receipt_long,
                  ),
                  tombolIkon(4, Icons.person_outline, Icons.person),
                ],
              ),
            ),

            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () => onTap(2),
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hijauGelap,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: hijauGelap.withValues(alpha: 0.40),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.map_outlined,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tombolIkon(int index, IconData ikon, IconData ikonAktif) {
    bool aktif = indexAktif == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Icon(
          aktif ? ikonAktif : ikon,
          size: 26,
          color: aktif ? hijauGelap : abuAbu,
        ),
      ),
    );
  }
}
