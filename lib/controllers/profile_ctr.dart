import 'package:flutter/cupertino.dart';
import 'package:recycle_skill/routes.dart';
import 'package:get/get.dart';

class ProfileCtr extends GetxController {
  RxInt currentLevel = 1.obs;
  RxInt currentPoints = 0.obs;
  RxInt maxPoints = 100.obs;

  RxInt balance = 350000.obs;
  RxInt ecoPoints = 650.obs;
  RxInt weeklyEcoPoints = 35.obs;

  // Kontribusi Hijau
  RxDouble collectedWasteKg = 32.5.obs;
  RxInt savedTrees = 3.obs;

  int get nextLevel => currentLevel.value + 1;
  String get currentLevelText => 'Echo Hero Tingkat ${currentLevel.value}';

  double get co2Reduction => ecoPoints.value / 25.0;

  String get formattedBalance {
    final s = balance.value.toString();
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp ${s.replaceAll(reg, '.')}';
  }

  //Level
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

    Get.snackbar(
      'Selamat!',
      'Anda telah naik level!',
      margin: const EdgeInsets.all(15),
      colorText: const Color.fromARGB(255, 0, 0, 0),
    );
  }

  //Saldo
  void onMutasiTap() {
    Get.toNamed(Routes.mutasi);
  }

  void onWithdrawTap() {
    Get.toNamed(Routes.tarik_tunai);
  }

  void onRedeemTap() {
    Get.toNamed(Routes.tukar_hadiah);
  }
}
