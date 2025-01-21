import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  const ProductListScreen({super.key, required this.categoryName, required this.categoryId});

  static const String name = '/product-list-screen';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController = Get.find<ProductListController>();

  @override
  void initState() {
    super.initState();
    _productListController.getProductListByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GetBuilder<ProductListController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const CenteredCircularProgressIndicator();
          }
          return GridView.builder(
            itemCount: controller.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 4,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                  child: ProductItemWidget(
                    productModel: controller.productList[index],
                  ),
              );
            },
          );
        }
      ),
    );
  }
}
