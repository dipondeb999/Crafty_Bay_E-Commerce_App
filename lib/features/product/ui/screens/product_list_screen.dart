import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  static const String name = '/product-list-screen';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 4,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return const FittedBox(
              // child: ProductItemWidget(),
          );
        },
      ),
    );
  }
}
