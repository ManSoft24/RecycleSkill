import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle_skill/components/custom_app_bar.dart';
import 'package:recycle_skill/components/tukar_sampah/tukar_sampah_header.dart';
import 'package:recycle_skill/components/tukar_sampah/waste_category_chips.dart';
import 'package:recycle_skill/components/tukar_sampah/waste_eco_banner.dart';
import 'package:recycle_skill/components/tukar_sampah/waste_item_card.dart';
import 'package:recycle_skill/components/tukar_sampah/waste_search_bar.dart';
import 'package:recycle_skill/components/tukar_sampah/waste_summary_bottom_bar.dart';
import 'package:recycle_skill/controllers/tukar_sampah_ctr.dart';
import 'package:recycle_skill/routes.dart';

class TukarSampahPage extends StatelessWidget {
  const TukarSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TukarSampahController controller = Get.put(TukarSampahController());
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFFFAF8FF),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TukarSampahHeader(),
            const SizedBox(height: 16),
            const WasteEcoBanner(),
            const SizedBox(height: 16),
            WasteSearchBar(
              controller: searchController,
              onChanged: (val) => controller.searchQuery.value = val,
              onScanQr: () {
                Get.snackbar(
                  'Scan Sampah',
                  'Fitur pemindai barcode / QR sampah siap digunakan',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color(0xFF131B2E),
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(16),
                  borderRadius: 12,
                  duration: const Duration(seconds: 2),
                );
              },
            ),
            const SizedBox(height: 14),
            Obx(
              () => WasteCategoryChips(
                categories: controller.categories,
                selectedCategory: controller.selectedCategory.value,
                onSelectCategory: (cat) =>
                    controller.selectedCategory.value = cat,
              ),
            ),
            const SizedBox(height: 16),
            Obx(() {
              final items = controller.filteredItems;
              if (items.isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Tidak ada jenis sampah yang cocok',
                        style: TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final qty = controller.getQuantity(item.id);

                  return WasteItemCard(
                    item: item,
                    quantity: qty,
                    onAdd: () => controller.addQuantity(item),
                    onSubtract: () => controller.subtractQuantity(item),
                  );
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => WasteSummaryBottomBar(
          selectedCount: controller.selectedCount,
          totalWeight: controller.totalWeight,
          estimatedSaldo: controller.estimatedSaldo,
          ecoPoints: controller.ecoPoints,
          onContinuePickup: () {
            Get.toNamed(Routes.tiket_pickup);
          },
        ),
      ),
    );
  }
}
