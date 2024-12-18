import 'package:crafty_bay_ecommerce_app/app/app_theme_data.dart';
import 'package:crafty_bay_ecommerce_app/app/controller_binder.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/common/ui/screens/main_bottom_nav_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) => const CompleteProfileScreen(),
        MainBottomNavScreen.name: (context) => const MainBottomNavScreen(),
      },
    );
  }
}
