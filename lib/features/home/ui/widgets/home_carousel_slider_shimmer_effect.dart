import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarouselSliderShimmerEffect extends StatelessWidget {
  const HomeCarouselSliderShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.12),
        highlightColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
