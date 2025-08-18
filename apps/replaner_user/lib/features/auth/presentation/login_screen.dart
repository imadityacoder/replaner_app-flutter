import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:replaner_user/common/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset('assets/logo/logo_full.png', width: 200),
              const SizedBox(height: 40),

              // Title
              const Text(
                "Enter your mobile number",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 0.95,
                ),
              ),
              const SizedBox(height: 20),

              // Card with phone number input
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter Number",
                  prefix: Text("+91 "),
                ),
              ),
              const SizedBox(height: 40),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/login/otp');
                  },
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: 20),

              // Terms and Privacy Policy
              const Text.rich(
                TextSpan(
                  text: "By continuing, You accept the ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(color: AppColors.accentDark),
                    ),
                    TextSpan(text: ", "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(color: AppColors.accentDark),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Content Policy",
                      style: TextStyle(color: AppColors.accentDark),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
