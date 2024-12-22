import 'package:crafty_bay_ecommerce_app/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';


class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = '/categories_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return const FittedBox(
            child: CategoryItemWidget(),
          );
        },
      ),
    );
  }

}
