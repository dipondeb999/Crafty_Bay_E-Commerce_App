import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productListController.getProductList();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _productListController.getProductList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<ProductListController>().refreshProductList();
          },
          child: GetBuilder<ProductListController>(
            builder: (controller) {
              if (controller.initialInProgress) {
                return const CenteredCircularProgressIndicator();
              }
              return GridView.builder(
                controller: _scrollController,
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
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
