import 'package:crafty_bay_ecommerce_app/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
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
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: const TextSpan(
                      text: 'This code will be expire in ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: '120s',
                        style: TextStyle(
                          color: AppColors.themeColor,
                        ),
                      ),
                    ]
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Resend Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
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
        selectedFillColor: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
