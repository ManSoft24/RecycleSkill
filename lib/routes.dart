import 'package:recycle_skill/pages/login_admin_pages.dart';
import 'package:recycle_skill/pages/login_siswa_pages.dart';
import 'package:recycle_skill/pages/main_menu_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'package:recycle_skill/pages/kursus_page.dart';
import 'package:recycle_skill/pages/riwayat_transaksi_page.dart';
import 'package:recycle_skill/pages/wallets/mutasi_pages.dart';
import 'package:recycle_skill/pages/wallets/tarik_tunai_pages.dart';
import 'package:recycle_skill/pages/wallets/tukar_hadiah_pages.dart';

class Routes {
  static const String main_menu = "/main_menu_pages";
  static const String tukar_hadiah = "/tukar_hadiah_pages";
  static const String tarik_tunai = "/tarik_tunai_pages";
  static const String mutasi = "/mutasi_pages";

  static const String kursus = "/kursus";
  static const String riwayat_transaksi = "/riwayat_transaksi";

  static const String login_siswa = "/login_siswa_pages";
  static const String login_admin = "/login_admin_pages";

  static final pages = [
    GetPage(name: main_menu, page: () => MainManuPages()),
    GetPage(name: tukar_hadiah, page: () => TukarHadiahPages()),
    GetPage(name: tarik_tunai, page: () => TarikTunaiPages()),
    GetPage(name: mutasi, page: () => MutasiPages()),

    GetPage(name: kursus, page: () => const KursusPage()),
    GetPage(name: riwayat_transaksi, page: () => const RiwayatTransaksiPage()),

    GetPage(name: login_siswa, page: () => LoginSiswaPages()),
    GetPage(name: login_admin, page: () => LoginAdminPages()),
  ];
}
