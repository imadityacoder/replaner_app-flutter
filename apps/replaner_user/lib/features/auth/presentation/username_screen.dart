import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({super.key});

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // Title
              const Text(
                "Enter your name",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 0.95,
                ),
              ),
              const SizedBox(height: 40),

              // First Name Field
              TextField(
                controller: _fnameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "First name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Last Name Field
              TextField(
                controller: _lnameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Last name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // You can also add validation here before navigation
                    context.go('/home');
                  },
                  child: const Text("Done"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
