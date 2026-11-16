enum WasteBadgeType {
  trend,
  popular,
  high,
  biofuel,
  none,
}

class WasteCatalogItem {
  final String id;
  final String name;
  final String description;
  final String category;
  final String categoryTag;
  final String? badgeText;
  final WasteBadgeType badgeType;
  final int pricePerUnit;
  final String unit;
  final String imagePath;
  final double stepQuantity;
  final double minQuantity;

  const WasteCatalogItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.categoryTag,
    this.badgeText,
    this.badgeType = WasteBadgeType.none,
    required this.pricePerUnit,
    this.unit = '/kg',
    required this.imagePath,
    this.stepQuantity = 0.5,
    this.minQuantity = 0.5,
  });
}
