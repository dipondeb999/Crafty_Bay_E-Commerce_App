import 'package:crafty_bay_ecommerce_project/features/cart/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/category/ui/screens/category_list_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/home_slider_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final HomeSliderListController _homeSliderListController = Get.find<HomeSliderListController>();
  final CategoryListController _categoryListController = Get.find<CategoryListController>();
  final PopularProductListController _productListByRemarkController = Get.find<PopularProductListController>();
  final SpecialProductListController _specialProductListController = Get.find<SpecialProductListController>();
  final NewProductListController _newProductListController = Get.find<NewProductListController>();

  @override
  void initState() {
    super.initState();
    _homeSliderListController.getSliders();
    _categoryListController.getCategoryList();
    _productListByRemarkController.getProductList();
    _specialProductListController.getProductList();
    _newProductListController.getProductList();
  }

  final List<Widget> screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: screens[bottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: bottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.favorite), label: 'Wishlist'),
            ],
          ),
        );
      }
    );
  }
}
