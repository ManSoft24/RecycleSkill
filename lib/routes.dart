import 'package:recycle_skill/pages/main_manu_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';

class Routes {
  static const String main_menu = "/main_menu_pages";

  static final pages = [GetPage(name: main_menu, page: () => MainManuPages())];
}
