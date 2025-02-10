import 'package:crafty_bay_ecommerce_project/features/auth/data/models/sign_up_model.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const name = '/sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogoWidget(
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                'Complete Profile',
                style: textTheme.titleLarge,
              ),
              Text(
                'Get started with us with your details',
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              _buildTextFormFields(),
              const SizedBox(height: 16),
              GetBuilder<SignUpController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapSignUpButton,
                    child: const Text('Sign Up'),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your email address';
              }
              if (EmailValidator.validate(value!) == false) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'First Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value) {
              if ((value?.isEmpty ?? true) || value!.length < 6) {
                return 'Enter a password more than 6 letters';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            maxLength: 11,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your mobile number';
              }
              if (RegExp(r'^01[3-9]\d{9}$').hasMatch(value!)) {
                return 'Enter valid mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _cityTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your city name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    SignUpModel params = SignUpModel(
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      password: _passwordTEController.text,
      mobile: _mobileTEController.text.trim(),
      city: _cityTEController.text.trim(),
    );

    final bool isSuccess = await _signUpController.signUp(params);
    if (isSuccess) {
     if (mounted) {
       Navigator.pushNamed(context, OtpVerificationScreen.name, arguments: _emailTEController.text.trim());
     }
    } else {
      if (mounted) {
        showSnackBarMessage(context, _signUpController.errorMessage!);
      }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    super.dispose();
  }
}
