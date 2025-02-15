import 'package:crafty_bay_ecommerce_project/app/assets_path.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/category_model.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/product_model.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/category_item_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/product_item_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/home_slider_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/widgets/home_carousel_slider_shimmer_effect.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/widgets/home_section_header.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/widgets/product_search_bar.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(
                controller: _searchBarController,
              ),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderListController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return HomeCarouselSliderShimmerEffect();
                  }
                  return HomeCarouselSlider(sliderList: controller.sliderListDataModel);
                }
              ),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              const SizedBox(height: 16),
              _buildPopularSection(),
              const SizedBox(height: 16),
              _buildSpecialSection(),
              const SizedBox(height: 16),
              _buildNewSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBarIconButton(
          onTap: () {},
          icon: Icons.person_outline,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          onTap: () {},
          icon: Icons.call_outlined,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          onTap: () {},
          icon: Icons.notifications_outlined,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {
            Get.find<MainBottomNavController>().moveToCategoryList();
          },
          title: 'All Categories',
        ),
        const SizedBox(height: 8),
        GetBuilder<CategoryListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return SizedBox(
                height: 100,
                child: CenteredCircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _getCategoryList(controller.categoryList),
              ),
            );
          }
        ),
      ],
    );
  }

  List<Widget> _getCategoryList(List<CategoryModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      categoryList.add(
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CategoryItemWidget(
            categoryModel: categoryModels[i],
          ),
        ),
      );
    }
    return categoryList;
  }

  Widget _buildPopularSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {
            Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Popular');
          },
          title: 'Popular',
        ),
        const SizedBox(height: 8),
        GetBuilder<PopularProductListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return SizedBox(
                height: 200,
                child: CenteredCircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _getProductList(controller.productList),
              ),
            );
          }
        ),
      ],
    );
  }

  List<Widget> _getProductList(List<ProductModel> productList) {
    List<Widget> list = [];
    for (int i = 0; i < productList.length; i++) {
      list.add(
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: ProductItemWidget(
            productModel: productList[i],
          ),
        ),
      );
    }
    return list;
  }

  Widget _buildSpecialSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {
            Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Special');
          },
          title: 'Special',
        ),
        const SizedBox(height: 8),
        GetBuilder<SpecialProductListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return SizedBox(
                height: 200,
                child: CenteredCircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _getProductList(controller.productList),
              ),
            );
          }
        ),
      ],
    );
  }

  Widget _buildNewSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {
            Navigator.pushNamed(context, ProductListScreen.name, arguments: 'New');
          },
          title: 'New',
        ),
        const SizedBox(height: 8),
        GetBuilder<NewProductListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return SizedBox(
                height: 200,
                child: CenteredCircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _getProductList(controller.productList),
              ),
            );
          }
        ),
      ],
    );
  }
}
