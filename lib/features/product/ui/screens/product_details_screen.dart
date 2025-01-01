import 'package:crafty_bay_ecommerce_app/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_app/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay_ecommerce_app/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ProductImageCarouselSlider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Happy New Year Special Deal Save 30%',
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Wrap(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Reviews'),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: AppColors.themeColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          ProductQuantityIncDecButton(
                            onChange: (int value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Color',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '\$100',
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
