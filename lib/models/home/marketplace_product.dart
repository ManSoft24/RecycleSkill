class MarketplaceProduct {
  final String title;
  final String price;
  final double rating;
  final String seller;
  final String? imagePath;
  final bool acceptsBalance;

  const MarketplaceProduct({
    required this.title,
    required this.price,
    this.rating = 4.9,
    this.seller = 'UMKM Desa',
    this.imagePath,
    this.acceptsBalance = true,
  });
}
