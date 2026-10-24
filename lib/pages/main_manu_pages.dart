import 'package:flutter/material.dart';
import 'package:recycle_skill/components/custom_bottom_navbar.dart';
import 'package:recycle_skill/controllers/main_menu_ctr.dart';
import 'package:get/get.dart';

class MainManuPages extends StatelessWidget {
  MainManuPages({super.key});

  final controllers = Get.put(MainMenuControllers());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 92),
              child: IndexedStack(
                index: controllers.selectedIndex.value,
                children: controllers.ListPage,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavbar(
                indexAktif: controllers.selectedIndex.value,
                onTap: controllers.changePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
