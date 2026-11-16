import 'package:get/get.dart';
import 'package:recycle_skill/models/tiket_pickup/pickup_point_model.dart';

class TiketPickupController extends GetxController {
  final RxString selectedVillage = 'Gondosari'.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedPointId = 'gebog_01'.obs;
  final RxString selectedDateId = 'date_1'.obs;
  final RxString selectedTimeId = 'time_1'.obs;

  final List<String> villages = const [
    'Semua Desa',
    'Gondosari',
    'Besito',
    'Gribig',
    'Jurang',
    'Rahtawu',
  ];

  final RxList<PickupPointModel> allPoints = <PickupPointModel>[
    const PickupPointModel(
      id: 'gebog_01',
      name: 'Pickup Point Gebog 01 — Balai Desa Gondosari',
      shortName: 'Balai Desa Gondosari',
      village: 'Gondosari',
      address: 'Jl. Raya Rahtawu Gebog No. 14, RT 02 / RW 03, Gondosari, Gebog, Kudus',
      distanceKm: 1.2,
      estimatedMinutes: 4,
      routeNote: 'via Jl. Raya Rahtawu',
      operationalSchedule: 'Kamis & Sabtu • 08.00 - 12.00 WIB',
      capacityStatus: 'Tersedia (Sisa kuota 85 kg)',
      isAvailable: true,
      isRecommended: true,
      facilities: ['Timbangan Digital', 'Petugas Siaga', 'Drop Box PET'],
      mapX: 0.54,
      mapY: 0.40,
    ),
    const PickupPointModel(
      id: 'gebog_02',
      name: 'Pickup Point Gebog 02 — Lapangan Besito',
      shortName: 'Lapangan Besito',
      village: 'Besito',
      address: 'Kompleks Olahraga Desa Besito, Gebog, Kudus',
      distanceKm: 2.8,
      estimatedMinutes: 8,
      routeNote: 'via Jl. Besito Raya',
      operationalSchedule: 'Jumat & Minggu • 08.00 - 11.00 WIB',
      capacityStatus: 'Tersedia',
      isAvailable: true,
      isRecommended: false,
      facilities: ['Timbangan Gantung', 'Area Parkir Luas', 'Drop Box Logam'],
      mapX: 0.76,
      mapY: 0.28,
    ),
    const PickupPointModel(
      id: 'gebog_03',
      name: 'Pickup Point Gebog 03 — Kantor Koperasi Gribig',
      shortName: 'Kantor Koperasi Gribig',
      village: 'Gribig',
      address: 'Jl. Gebog - Kudus Km 4, Gribig, Gebog',
      distanceKm: 4.1,
      estimatedMinutes: 12,
      routeNote: 'via Jl. Gebog - Kudus',
      operationalSchedule: 'Senin & Rabu • 09.00 - 12.00 WIB',
      capacityStatus: 'Buka Besok',
      isAvailable: true,
      isRecommended: false,
      facilities: ['Timbangan Digital', 'Drop Box Kertas'],
      mapX: 0.16,
      mapY: 0.25,
    ),
  ].obs;

  final List<PickupDateSlot> dateSlots = const [
    PickupDateSlot(
      id: 'date_1',
      dateText: '15 Okt',
      dayName: 'Kamis',
      badgeText: 'REKOMENDASI',
      isRecommended: true,
    ),
    PickupDateSlot(
      id: 'date_2',
      dateText: '17 Okt',
      dayName: 'Sabtu',
      badgeText: 'Tersedia',
      isRecommended: false,
    ),
    PickupDateSlot(
      id: 'date_3',
      dateText: '22 Okt',
      dayName: 'Kamis',
      badgeText: 'Tersedia',
      isRecommended: false,
    ),
  ];

  final List<PickupTimeSlot> timeSlots = const [
    PickupTimeSlot(
      id: 'time_1',
      timeRange: '08.00 - 10.00 WIB',
      isMorningBonus: true,
    ),
    PickupTimeSlot(
      id: 'time_2',
      timeRange: '10.00 - 12.00 WIB',
      isMorningBonus: false,
    ),
  ];

  List<PickupPointModel> get filteredPoints {
    return allPoints.where((p) {
      final matchesVillage = selectedVillage.value == 'Semua Desa' ||
          p.village.toLowerCase() == selectedVillage.value.toLowerCase();
      final matchesSearch = searchQuery.value.isEmpty ||
          p.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          p.address.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          p.village.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesVillage && matchesSearch;
    }).toList();
  }

  PickupPointModel get selectedPoint {
    return allPoints.firstWhere(
      (p) => p.id == selectedPointId.value,
      orElse: () => allPoints.first,
    );
  }

  PickupDateSlot get selectedDate {
    return dateSlots.firstWhere(
      (d) => d.id == selectedDateId.value,
      orElse: () => dateSlots.first,
    );
  }

  PickupTimeSlot get selectedTime {
    return timeSlots.firstWhere(
      (t) => t.id == selectedTimeId.value,
      orElse: () => timeSlots.first,
    );
  }

  void selectPoint(String pointId) {
    selectedPointId.value = pointId;
  }

  void selectVillage(String village) {
    selectedVillage.value = village;
    // Auto-select first matching point if any
    final matches = allPoints.where((p) =>
        village == 'Semua Desa' || p.village.toLowerCase() == village.toLowerCase()).toList();
    if (matches.isNotEmpty) {
      selectedPointId.value = matches.first.id;
    }
  }

  void selectDate(String dateId) {
    selectedDateId.value = dateId;
  }

  void selectTime(String timeId) {
    selectedTimeId.value = timeId;
  }

  String get bottomBarSummaryText {
    final point = selectedPoint;
    final date = selectedDate;
    final time = selectedTime;
    final shortTime = time.timeRange.replaceAll(' WIB', '');
    return '${point.shortName} • ${date.dayName}, ${date.dateText} ($shortTime)';
  }
}
