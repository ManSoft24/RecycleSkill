import 'package:flutter/material.dart';
import 'package:recycle_skill/models/home/marketplace_product.dart';

export 'package:recycle_skill/models/home/marketplace_product.dart';

class MarketplaceCatalog extends StatelessWidget {
  final List<MarketplaceProduct> products;
  final String fallbackImagePath;
  final Function(MarketplaceProduct product)? onProductTap;

  const MarketplaceCatalog({
    super.key,
    required this.products,
    this.fallbackImagePath = 'image/dummy_placeholder.png',
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.68,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(context, product);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, MarketplaceProduct product) {
    return GestureDetector(
      onTap: () => onProductTap?.call(product),
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color(0xFFF3F4F6),
                    child: Image.asset(
                      product.imagePath ?? fallbackImagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFF3F4F6),
                          child: const Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 32,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (product.acceptsBalance)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF065F46),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Bisa Saldo',
                        style: TextStyle(
                          fontFamily: 'Jakarta',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                size: 14,
                color: Color(0xFFF59E0B),
              ),
              const SizedBox(width: 2),
              Text(
                product.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontFamily: 'Jakarta',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '•',
                style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  product.seller,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Jakarta',
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            product.price,
            style: const TextStyle(
              fontFamily: 'Jakarta',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF047857),
            ),
          ),
        ],
      ),
    );
  }
}
