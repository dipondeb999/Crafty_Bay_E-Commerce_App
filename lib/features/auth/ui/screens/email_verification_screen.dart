import 'package:crafty_bay_ecommerce_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const name = '/email-verification-screen';

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEController = TextEditingController();
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
                ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: _emailTEController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
    );
  }

  void _onTapNextButton() {
    // if (_formKey.currentState!.validate()) {}
    Navigator.pushNamed(context, OtpVerificationScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
