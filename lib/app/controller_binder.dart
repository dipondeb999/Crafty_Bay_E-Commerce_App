import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/home_slider_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/controllers/product_details_controller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(AuthController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(HomeSliderListController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
  }
}
