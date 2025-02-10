import 'dart:async';
import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_project/app/app_constant.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

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
  final OtpVerificationController _otpVerificationController = Get.find<OtpVerificationController>();

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
              GetBuilder<OtpVerificationController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  );
                }
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
        validator: (String? value) {
          if (value?.length != 6) {
            return 'Enter your otp code';
          }
          return null;
        },
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

  Future<void> _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await _otpVerificationController.verifyOtp(widget.email, _otpTEController.text);
      if (isSuccess) {
        if (_otpVerificationController.shouldNavigateCompleteProfile) {
          if (mounted) {
            Navigator.pushNamed(context, SignUpScreen.name);
          } else {
            if (mounted) {
              Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate) => false);
            }
          }
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _otpVerificationController.errorMessage!);
        }
      }
    }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    timer.cancel();
    super.dispose();
  }
}
