import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:replaner_user/common/theme/app_colors.dart';
import 'package:replaner_user/features/auth/provider/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _sendOtp(BuildContext context) async {
    final phone = "+91${_phoneController.text.trim()}";

    setState(() => _isLoading = true);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        if (!mounted) return;
        context.go('/home');
      },
      verificationFailed: (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
      },
      codeSent: (verificationId, resendToken) {
        ref.read(verificationIdProvider.notifier).state = verificationId;
        ref.read(phoneNumberProvider.notifier).state = phone;

        context.push('/login/otp');
      },
      codeAutoRetrievalTimeout: (verificationId) {
        ref.read(verificationIdProvider.notifier).state = verificationId;
      },
    );

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo/logo_full.png', width: 200),
                const SizedBox(height: 40),

                // Title
                const Text(
                  "Enter your mobile number",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Phone Input Field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: "Enter Number",
                    counterText: "",
                    prefix: const Text(
                      "+91 ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.accentDark,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your number";
                    } else if (value.length != 10) {
                      return "Enter a valid 10-digit number";
                    }
                    return null;
                  },

                  onFieldSubmitted: _isLoading
                      ? null
                      : (q) async {
                          if (_formKey.currentState!.validate()) {
                            await _sendOtp(context);
                          }
                        },
                ),
                const SizedBox(height: 40),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              await _sendOtp(context);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Continue"),
                  ),
                ),
                const SizedBox(height: 20),

                // Terms
                const Text.rich(
                  TextSpan(
                    text: "By continuing, You accept the ",
                    style: TextStyle(
                      fontSize: 14,
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
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
