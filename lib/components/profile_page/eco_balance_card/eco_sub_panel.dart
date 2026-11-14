import 'package:flutter/material.dart';


class EcoSubPanel extends StatelessWidget {
  final int ecoPoints;
  final int weeklyPoints;
  final double co2Reduction;

  const EcoSubPanel({
    super.key,
    required this.ecoPoints,
    required this.weeklyPoints,
    required this.co2Reduction,
  });

  String get _formattedCo2 {
    if (co2Reduction == co2Reduction.truncateToDouble()) {
      return co2Reduction.toInt().toString();
    }
    return co2Reduction.toStringAsFixed(1).replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(38, 255, 255, 255),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 221, 184),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 42, 23, 0),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$ecoPoints Poin Eco',
                          style: const TextStyle(
                            fontFamily: 'Jakarta',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        'Setara reduksi $_formattedCo2 kg CO₂',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Jakarta',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),

          Flexible(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(38, 255, 255, 255),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                '+$weeklyPoints Poin minggu ini',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
