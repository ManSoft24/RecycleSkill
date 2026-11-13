import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

class EcoActionButtons extends StatelessWidget {
  final VoidCallback? onWithdrawTap;
  final VoidCallback? onRedeemTap;

  const EcoActionButtons({
    super.key,
    this.onWithdrawTap,
    this.onRedeemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 42,
            child: ElevatedButton(
              onPressed: onWithdrawTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF006C4C),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Linecons.money,
                    size: 17,
                    color: Color(0xFF006C4C),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Tarik Tunai',
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: SizedBox(
            height: 42,
            child: ElevatedButton(
              onPressed: onRedeemTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9CF2E8),
                foregroundColor: const Color(0xFF064E3B),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard_rounded,
                    size: 17,
                    color: Color(0xFF064E3B),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Tukar Hadiah',
                    style: TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
