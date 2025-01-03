import 'package:crafty_bay_ecommerce_app/app/assets_path.dart';
import 'package:crafty_bay_ecommerce_app/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecommerce_app/features/common/ui/widgets/category_item_widget.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/home_section_header.dart';
import 'package:crafty_bay_ecommerce_app/features/common/ui/widgets/product_item_widget.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/product_search_bar.dart';
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
              const HomeCarouselSlider(),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getCategoryList(),
          ),
        ),
      ],
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CategoryItemWidget(),
        ),
      );
    }
    return categoryList;
  }

  Widget _buildPopularSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {},
          title: 'Popular',
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getProductList(),
          ),
        ),
      ],
    );
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: ProductItemWidget(),
        ),
      );
    }
    return productList;
  }

  Widget _buildSpecialSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {},
          title: 'Special',
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getProductList(),
          ),
        ),
      ],
    );
  }

  Widget _buildNewSection() {
    return Column(
      children: [
        HomeSectionHeader(
          onTap: () {},
          title: 'New',
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getProductList(),
          ),
        ),
      ],
    );
  }
}
