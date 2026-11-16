class PickupPointModel {
  final String id;
  final String name;
  final String shortName;
  final String village;
  final String address;
  final double distanceKm;
  final int estimatedMinutes;
  final String routeNote;
  final String operationalSchedule;
  final String capacityStatus;
  final bool isAvailable;
  final bool isRecommended;
  final List<String> facilities;
  final double mapX; // 0.0 to 1.0 (relative X in map card)
  final double mapY; // 0.0 to 1.0 (relative Y in map card)

  const PickupPointModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.village,
    required this.address,
    required this.distanceKm,
    required this.estimatedMinutes,
    required this.routeNote,
    required this.operationalSchedule,
    required this.capacityStatus,
    this.isAvailable = true,
    this.isRecommended = false,
    required this.facilities,
    required this.mapX,
    required this.mapY,
  });
}

class PickupDateSlot {
  final String id;
  final String dateText;
  final String dayName;
  final String badgeText;
  final bool isRecommended;

  const PickupDateSlot({
    required this.id,
    required this.dateText,
    required this.dayName,
    required this.badgeText,
    this.isRecommended = false,
  });
}

class PickupTimeSlot {
  final String id;
  final String timeRange;
  final bool isMorningBonus;

  const PickupTimeSlot({
    required this.id,
    required this.timeRange,
    this.isMorningBonus = false,
  });
}
