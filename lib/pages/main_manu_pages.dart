import 'package:flutter/material.dart';
import 'package:recycle_skill/controllers/main_menu_ctr.dart';
import 'package:get/get.dart';

class MainManuPages extends StatelessWidget {
  MainManuPages({super.key});

  final controllers = Get.put(MainMenuControllers());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controllers.selectedIndex.value,
          children: controllers.ListPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controllers.changePage,
          currentIndex: controllers.selectedIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
