import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Color.fromARGB(255, 61, 74, 66),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: "Jakarta",
              fontSize: 15,
              fontWeight: FontWeight(500),
            ),
          ),
        ],
      ),
    );
  }
}
