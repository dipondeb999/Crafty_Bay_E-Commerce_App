import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/home/ui/controllers/product_list_by_remark_controller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
    Get.put(HomeBannerListController());
    Get.put(CategoryListController());
    Get.put(ProductListByRemarkController());
  }
}
