import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const name = '/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

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
                  'Welcome Back',
                  style: textTheme.titleLarge,
                ),
                Text(
                  'Please enter your email address',
                  style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(),
                const SizedBox(height: 16),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    if (controller.inProgress) {
                      return const CenteredCircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: _onTapSignInButton,
                      child: const Text('Sign In'),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    return Column(
      children: [
        TextFormField(
          controller: _emailTEController,
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Email address',
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
        SizedBox(height: 8),
        TextFormField(
          controller: _passwordTEController,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return 'Enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }

  Future<void> _onTapSignInButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await _signInController.signIn(
          _emailTEController.text.trim(),
          _passwordTEController.text,
      );
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, MainBottomNavScreen.name, arguments: _emailTEController.text.trim());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _signInController.errorMessage!);
        }
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
