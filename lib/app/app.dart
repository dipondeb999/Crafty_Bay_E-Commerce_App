import 'package:crafty_bay_ecommerce_app/app/app_theme_data.dart';
import 'package:crafty_bay_ecommerce_app/app/controller_binder.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;

        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == EmailVerificationScreen.name) {
          widget = const EmailVerificationScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          widget = const OtpVerificationScreen();
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        } else if (settings.name == ProductDetailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(productId: productId);
        }

        return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        );
      },
    );
  }
}
