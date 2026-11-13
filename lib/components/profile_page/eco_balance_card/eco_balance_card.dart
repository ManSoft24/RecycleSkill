import 'package:flutter/material.dart';
import 'package:recycle_skill/components/profile_page/eco_balance_card/eco_action_buttons.dart';
import 'package:recycle_skill/components/profile_page/eco_balance_card/eco_balance_amount.dart';
import 'package:recycle_skill/components/profile_page/eco_balance_card/eco_balance_header.dart';
import 'package:recycle_skill/components/profile_page/eco_balance_card/eco_sub_panel.dart';

class EcoBalanceCard extends StatelessWidget {
  final String balance;
  final int ecoPoints;
  final int weeklyPoints;
  final double? co2Reduction;
  final VoidCallback? onMutasiTap;
  final VoidCallback? onWithdrawTap;
  final VoidCallback? onRedeemTap;

  const EcoBalanceCard({
    super.key,
    required this.balance,
    required this.ecoPoints,
    required this.weeklyPoints,
    this.co2Reduction,
    this.onMutasiTap,
    this.onWithdrawTap,
    this.onRedeemTap,
  });

  double get _effectiveCo2Reduction => co2Reduction ?? (ecoPoints / 25.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00694A),
            Color(0xFF1D7A68),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF006C4C).withValues(alpha: 0.25),
            blurRadius: 12.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -15,
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.12,
                  child: Image.asset(
                    'image/piggy_bank_icon.png',
                    width: 130,
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  EcoBalanceHeader(
                    onMutasiTap: onMutasiTap,
                  ),
                  const SizedBox(height: 10.0),
                  EcoBalanceAmount(
                    amount: balance,
                  ),
                  const SizedBox(height: 14.0),
                  EcoSubPanel(
                    ecoPoints: ecoPoints,
                    weeklyPoints: weeklyPoints,
                    co2Reduction: _effectiveCo2Reduction,
                  ),
                  const SizedBox(height: 14.0),
                  EcoActionButtons(
                    onWithdrawTap: onWithdrawTap,
                    onRedeemTap: onRedeemTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
