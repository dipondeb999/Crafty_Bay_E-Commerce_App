import 'package:crafty_bay_ecommerce_project/features/cart/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/category/ui/screens/category_list_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final HomeBannerListController _homeBannerListController = Get.find<HomeBannerListController>();
  final CategoryListController _categoryListController = Get.find<CategoryListController>();

  @override
  void initState() {
    super.initState();
    _homeBannerListController.getHomeBannerList();
    _categoryListController.getCategoryList();
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
