import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/screens/create_review_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/widgets/review_item_widget.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  static const String name = '/reviews-screen';

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ReviewItemWidget();
              },
            ),
          ),
          _buildReviewsSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews (1000)',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                backgroundColor: AppColors.themeColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CreateReviewScreen.name);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white, // Icon color
              ),
            ),
          )
        ],
      ),
    );
  }
}
