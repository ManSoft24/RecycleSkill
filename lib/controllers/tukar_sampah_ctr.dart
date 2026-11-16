import 'package:get/get.dart';
import 'package:recycle_skill/models/tukar_sampah/waste_catalog_item.dart';

class TukarSampahController extends GetxController {
  final RxString selectedCategory = 'Semua Sampah'.obs;
  final RxString searchQuery = ''.obs;

  final List<String> categories = const [
    'Semua Sampah',
    'Plastik',
    'Kertas & Kardus',
    'Logam & Kaleng',
    'Minyak Jelantah',
    'Elektronik',
  ];

  final RxList<WasteCatalogItem> allItems = <WasteCatalogItem>[
    const WasteCatalogItem(
      id: 'pet_bening',
      name: 'Botol Plastik PET Bening',
      description: 'Air mineral, minuman kemasan, botol teh',
      category: 'Plastik',
      categoryTag: 'Plastik #1',
      badgeText: '+Rp 200',
      badgeType: WasteBadgeType.trend,
      pricePerUnit: 4500,
      unit: '/kg',
      imagePath: 'image/sampah_pet.png',
      stepQuantity: 1.0,
      minQuantity: 1.0,
    ),
    const WasteCatalogItem(
      id: 'hdpe',
      name: 'Botol Plastik HDPE',
      description: 'Botol shampo, sabun cair, deterjen tebal',
      category: 'Plastik',
      categoryTag: 'Plastik #2',
      badgeText: null,
      badgeType: WasteBadgeType.none,
      pricePerUnit: 3800,
      unit: '/kg',
      imagePath: 'image/sampah_hdpe.png',
      stepQuantity: 1.0,
      minQuantity: 1.0,
    ),
    const WasteCatalogItem(
      id: 'kardus_tebal',
      name: 'Kardus Box Cokelat Tebal',
      description: 'Kardus paket ekspedisi, box mie/minuman',
      category: 'Kertas & Kardus',
      categoryTag: 'Kertas/Kardus',
      badgeText: 'Populer',
      badgeType: WasteBadgeType.popular,
      pricePerUnit: 2800,
      unit: '/kg',
      imagePath: 'image/sampah_kardus.png',
      stepQuantity: 1.0,
      minQuantity: 1.0,
    ),
    const WasteCatalogItem(
      id: 'kertas_hvs',
      name: 'Kertas HVS & Arsip Kantor',
      description: 'Kertas printout, majalah putih, buku tulis',
      category: 'Kertas & Kardus',
      categoryTag: 'Kertas',
      badgeText: null,
      badgeType: WasteBadgeType.none,
      pricePerUnit: 2200,
      unit: '/kg',
      imagePath: 'image/sampah_kertas.png',
      stepQuantity: 1.0,
      minQuantity: 1.0,
    ),
    const WasteCatalogItem(
      id: 'kaleng_alu',
      name: 'Kaleng Minuman Aluminium',
      description: 'Kaleng soda, minuman berenergi, kaleng susu',
      category: 'Logam & Kaleng',
      categoryTag: 'Logam Premium',
      badgeText: 'Tinggi',
      badgeType: WasteBadgeType.high,
      pricePerUnit: 14000,
      unit: '/kg',
      imagePath: 'image/sampah_kaleng.png',
      stepQuantity: 0.5,
      minQuantity: 0.5,
    ),
    const WasteCatalogItem(
      id: 'besi_campur',
      name: 'Besi & Logam Campur',
      description: 'Besi plat, siku, kawat, peralatan dapur tua',
      category: 'Logam & Kaleng',
      categoryTag: 'Logam',
      badgeText: null,
      badgeType: WasteBadgeType.none,
      pricePerUnit: 5000,
      unit: '/kg',
      imagePath: 'image/sampah_besi.png',
      stepQuantity: 1.0,
      minQuantity: 1.0,
    ),
    const WasteCatalogItem(
      id: 'jelantah_uco',
      name: 'Minyak Jelantah (UCO Jerigen)',
      description: 'Minyak goreng bekas dapur tersaring dalam botol/jerigen',
      category: 'Minyak Jelantah',
      categoryTag: 'Minyak Nabati',
      badgeText: 'UCO Biofuel',
      badgeType: WasteBadgeType.biofuel,
      pricePerUnit: 7500,
      unit: '/liter',
      imagePath: 'image/sampah_jelantah.png',
      stepQuantity: 1.0,
      minQuantity: 1.0,
    ),
  ].obs;

  // Selected quantities map {itemId: quantity}
  // Matches initial state in Figcraft (3kg PET, 5kg Kardus, 1.5kg Kaleng)
  final RxMap<String, double> selectedQuantities = <String, double>{
    'pet_bening': 3.0,
    'kardus_tebal': 5.0,
    'kaleng_alu': 1.5,
  }.obs;

  List<WasteCatalogItem> get filteredItems {
    return allItems.where((item) {
      final matchesCategory = selectedCategory.value == 'Semua Sampah' ||
          item.category == selectedCategory.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          item.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          item.description.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          item.categoryTag.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  double getQuantity(String itemId) {
    return selectedQuantities[itemId] ?? 0.0;
  }

  void addQuantity(WasteCatalogItem item) {
    final current = selectedQuantities[item.id] ?? 0.0;
    if (current == 0.0) {
      selectedQuantities[item.id] = item.minQuantity;
    } else {
      selectedQuantities[item.id] = current + item.stepQuantity;
    }
  }

  void subtractQuantity(WasteCatalogItem item) {
    final current = selectedQuantities[item.id] ?? 0.0;
    if (current <= item.minQuantity) {
      selectedQuantities.remove(item.id);
    } else {
      selectedQuantities[item.id] = current - item.stepQuantity;
    }
  }

  int get selectedCount => selectedQuantities.length;

  double get totalWeight {
    double sum = 0.0;
    selectedQuantities.forEach((_, qty) {
      sum += qty;
    });
    return sum;
  }

  int get estimatedSaldo {
    double total = 0.0;
    selectedQuantities.forEach((id, qty) {
      final item = allItems.firstWhereOrNull((i) => i.id == id);
      if (item != null) {
        total += item.pricePerUnit * qty;
      }
    });
    return total.round();
  }

  int get ecoPoints {
    if (selectedCount == 0) return 0;
    // Calculation: base points per kg + bonus tier as shown in Figcraft (+25 Poin)
    return (totalWeight * 2.6).round().clamp(10, 100);
  }

  String formatCurrency(num amount) {
    final str = amount.toStringAsFixed(0);
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final formatted = str.replaceAllMapped(reg, (Match m) => '${m[1]}.');
    return 'Rp$formatted';
  }

  String formatQuantityText(double qty, String unit) {
    final isInt = qty % 1 == 0;
    final qtyStr = isInt ? qty.toInt().toString() : qty.toString();
    final cleanUnit = unit.replaceAll('/', '');
    return '$qtyStr $cleanUnit';
  }
}
