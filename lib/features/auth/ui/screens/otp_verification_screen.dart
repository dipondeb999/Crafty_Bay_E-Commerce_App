import 'dart:async';

import 'package:crafty_bay_ecommerce_app/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_app/app/app_constant.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const name = '/otp-verification-screen';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstant.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstant.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const AppLogoWidget(),
              const SizedBox(height: 16),
              Text(
                'Enter OTP Code',
                style: textTheme.titleLarge,
              ),
              Text(
                'A 4 digit OTP code has been sent',
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              _buildPinCodeTextField(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapNextButton,
                child: const Text('Next'),
              ),
              const SizedBox(height: 24),
              _buildTimerSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return Form(
      key: _formKey,
      child: PinCodeTextField(
        controller: _otpTEController,
        appContext: context,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        backgroundColor: Colors.transparent,
        textStyle: const TextStyle(
          color: Colors.black,
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          selectedColor: AppColors.themeColor,
          activeColor: AppColors.themeColor,
          inactiveColor: AppColors.themeColor,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildTimerSection() {
    return Column(
      children: [
        Obx(
          () => Visibility(
            visible: !_enableResendCodeButton.value,
            child: RichText(
              text: TextSpan(
                text: 'This code will be expire in ',
                style: const TextStyle(
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: '${_remainingTime}s',
                    style: const TextStyle(
                      color: AppColors.themeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => Visibility(
            visible: _enableResendCodeButton.value,
            child: TextButton(
              onPressed: () {
                _startResendCodeTimer();
              },
              child: const Text('Resend Code'),
            ),
          ),
        ),
      ],
    );
  }

  void _onTapNextButton() {
    // if (_formKey.currentState!.validate()) {}
    Navigator.pushNamed(context, CompleteProfileScreen.name);
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    timer.cancel();
    super.dispose();
  }
}
