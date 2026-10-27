import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;

  final RxBool isChecked = false.obs;

  CustomCheckbox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (isChecked) => InkWell(
        onTap: () => isChecked.toggle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isChecked.value,
              onChanged: (newValue) {
                isChecked.value = newValue ?? false;
              },
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
      ),
      false.obs,
    );
  }
}
