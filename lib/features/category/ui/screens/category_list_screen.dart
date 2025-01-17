import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/category_item_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = '/categories_screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Categories'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if (controller.inProgress) {
                return CenteredCircularProgressIndicator();
              }
              return GridView.builder(
                itemCount: controller.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: CategoryItemWidget(
                      categoryModel: controller.categoryList[index],
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
