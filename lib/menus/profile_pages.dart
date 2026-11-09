import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:recycle_skill/components/custom_app_bar.dart';
import 'package:recycle_skill/components/profile_page/profile_header.dart';
import 'package:recycle_skill/components/profile_page/level_progress_bar/level_progress_card.dart';
import 'package:recycle_skill/controllers/profile_ctr.dart';


class ProfilePages extends StatelessWidget {
  ProfilePages({super.key});

  final controller = Get.put(ProfileCtr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
        child: Column(
          children: [
            ProfileHeader(),

            //nanti bisa di bagian ketika sudah di buatkan sistem transaksinya, tiap transaksi sampah yang berhasil
            //bisa ntr nambah point
            Obx(() => LevelProgressCard(
              currentLevel: controller.currentLevelText.toString(),
              nextLevel: controller.nextLevel,
              currentPoints: controller.currentPoints.value,
              maxPoints: controller.maxPoints.value,
            )),

            ElevatedButton(
              onPressed: () {
                controller.addPoints(10);
              },
              child: const Text(' Test Add 10 Points'),
            ),

              
          ],
        ),
      ),
    );
  }
}
