import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class ProfileCtr extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt currentPoints = 0.obs;
  RxInt maxPoints = 100.obs;

  int get nextLevel => currentLevel.value + 1;
  String get currentLevelText => 'Echo Hero Tingkat ${currentLevel.value}';

  void addPoints(int points) {
    currentPoints.value += points;

    if (currentPoints.value >= maxPoints.value) {
      levelUp();
    }
  }

  void levelUp() {
    currentPoints.value -= maxPoints.value;
    currentLevel.value++;
    maxPoints.value += 100;

    Get.snackbar('Selamat!', 'Anda telah naik level!',
    margin: const EdgeInsets.all(15),
    colorText: const Color.fromARGB(255,0, 0, 0)
    );
  }
}
