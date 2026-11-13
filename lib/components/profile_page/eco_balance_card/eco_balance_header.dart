import 'package:flutter/material.dart';

class EcoBalanceHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onMutasiTap;

  const EcoBalanceHeader({
    super.key,
    this.title = 'Saldo Hasil Daur Ulang',
    this.onMutasiTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 17,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(width: 5,),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Jakarta',
                color: Color(0xFFE2F3ED),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          width: 90,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(38, 255, 255, 255)
          ),
          child: GestureDetector(
            onTap: onMutasiTap,
            behavior: HitTestBehavior.opaque,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  'Mutasi',
                  style: TextStyle(
                    fontFamily: 'Jakarta',
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
