import 'package:crafty_bay_ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _buildProductImage(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    'New Year Special Shoe 30',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 2),
                  _buildProductDetails(),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.12),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Image.asset(
        'assets/images/nike_shoe.png',
        width: 140,
        height: 80,
      ),
    );
  }

  Widget _buildProductDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '\$100',
          style: TextStyle(
            color: AppColors.themeColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            Text(
              '4.5',
              style: TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
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
    );
  }
}
