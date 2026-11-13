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
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(38, 255,255,255),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(3.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 221, 184),
              borderRadius: BorderRadius.circular(8.0),

            ),
            child: Icon(
              Icons.star,
              color: Color.fromARGB(255,42, 23, 0),
              size: 25,
            ),
          ),

          const SizedBox(width: 10,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$ecoPoints Poin Eco',
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4.0),
              Text(
                'Setara reduksi \n$_formattedCo2 kg CO₂',
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 3.0,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(38, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  '+$weeklyPoints Poin minggu ini',
                  style: const TextStyle(
                    fontFamily: 'Jakarta',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
