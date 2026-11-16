import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycle_skill/components/custom_app_bar.dart';
import 'package:recycle_skill/components/tiket_pickup/pickup_datetime_picker_card.dart';
import 'package:recycle_skill/components/tiket_pickup/pickup_page_header.dart';
import 'package:recycle_skill/components/tiket_pickup/pickup_point_card.dart';
import 'package:recycle_skill/components/tiket_pickup/pickup_sticky_bottom_bar.dart';
import 'package:recycle_skill/components/tiket_pickup/stepper_progress_header.dart';
import 'package:recycle_skill/components/tiket_pickup/stylized_map_preview_card.dart';
import 'package:recycle_skill/components/tiket_pickup/village_filter_chips.dart';
import 'package:recycle_skill/controllers/tiket_pickup_ctr.dart';

class TiketPickupPage extends StatelessWidget {
  const TiketPickupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TiketPickupController controller = Get.put(TiketPickupController());
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
            // Step 2 of 3 progress
            const StepperProgressHeader(),
            const SizedBox(height: 16),

            // Header Intro & DLH Kudus badge
            const PickupPageHeader(),
            const SizedBox(height: 16),

            // Search Bar with Filter Map
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF6D7A72),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (val) => controller.searchQuery.value = val,
                      style: const TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 13,
                        color: Color(0xFF131B2E),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Cari desa / nama lokasi di Gebog...',
                        hintStyle: TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D7A72),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Get.snackbar(
                          'Filter Lokasi',
                          'Filter lokasi dan radius penjemputan Gebog',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: const Color(0xFF131B2E),
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: Icon(
                          Icons.tune_rounded,
                          color: Color(0xFF3D4A42),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Village Filter Chips
            Obx(
              () => VillageFilterChips(
                villages: controller.villages,
                selectedVillage: controller.selectedVillage.value,
                onSelectVillage: controller.selectVillage,
              ),
            ),
            const SizedBox(height: 16),

            // Stylized Interactive Map Preview Card
            Obx(
              () => StylizedMapPreviewCard(
                points: controller.allPoints,
                selectedPoint: controller.selectedPoint,
                onSelectPoint: controller.selectPoint,
                onOpenRoute: () {
                  final pt = controller.selectedPoint;
                  Get.snackbar(
                    'Buka Rute Navigasi',
                    'Membuka panduan rute GPS menuju ${pt.name}',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color(0xFF006948),
                    colorText: Colors.white,
                    icon: const Icon(
                      Icons.navigation_rounded,
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Section Header: Daftar Lokasi di Gebog
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Daftar Lokasi di Gebog',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF131B2E),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Menampilkan ${controller.filteredPoints.length} lokasi',
                    style: const TextStyle(
                      fontFamily: 'Jakarta',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3D4A42),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // List of Pickup Point Cards
            Obx(() {
              final points = controller.filteredPoints;
              if (points.isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 36),
                  child: Center(
                    child: Text(
                      'Tidak ada lokasi pickup di desa ini',
                      style: TextStyle(
                        fontFamily: 'Jakarta',
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: points.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final point = points[index];
                  final isSelected = point.id == controller.selectedPointId.value;

                  return PickupPointCard(
                    point: point,
                    isSelected: isSelected,
                    onTap: () => controller.selectPoint(point.id),
                  );
                },
              );
            }),
            const SizedBox(height: 20),

            // Select Date & Time Slot Card
            Obx(
              () => PickupDatetimePickerCard(
                dateSlots: controller.dateSlots,
                selectedDateId: controller.selectedDateId.value,
                onSelectDate: controller.selectDate,
                timeSlots: controller.timeSlots,
                selectedTimeId: controller.selectedTimeId.value,
                onSelectTime: controller.selectTime,
              ),
            ),
          ],
        ),
      ),

      // Sticky Confirmation Action Bottom Bar (Always pinned at the bottom!)
      bottomNavigationBar: Obx(
        () => PickupStickyBottomBar(
          pointName: controller.selectedPoint.shortName,
          dateTimeText:
              '${controller.selectedDate.dayName}, ${controller.selectedDate.dateText} (${controller.selectedTime.timeRange.replaceAll(' WIB', '')})',
          districtTag: 'Gebog',
          onContinueConfirmation: () {
            Get.snackbar(
              'Konfirmasi Penukaran',
              'Melanjutkan ke konfirmasi: ${controller.selectedPoint.shortName} pada ${controller.selectedDate.dateText}',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: const Color(0xFF006948),
              colorText: Colors.white,
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(16),
              borderRadius: 12,
              duration: const Duration(seconds: 3),
            );
          },
        ),
      ),
    );
  }
}
