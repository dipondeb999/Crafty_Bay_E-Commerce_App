import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/category_model.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItemWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, ProductListScreen.name,
          arguments: {
            'categoryName': categoryModel.categoryName ?? '',
            'categoryId': categoryModel.id!,
          },
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
                categoryModel.categoryImg ?? '',
              height: 40,
              width: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoryModel.categoryName ?? '',
            style: TextStyle(
              color: AppColors.themeColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}