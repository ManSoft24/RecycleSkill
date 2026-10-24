import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:recycle_skill/menus/dummy.dart';
import 'package:recycle_skill/menus/home_pages.dart';

class MainMenuControllers extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> ListPage = [HomePage(), Dummy()];
}
