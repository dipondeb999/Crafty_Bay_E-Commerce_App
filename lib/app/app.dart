import 'package:crafty_bay_ecommerce_app/app/app_theme_data.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';


class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
      },
    );
  }
}
