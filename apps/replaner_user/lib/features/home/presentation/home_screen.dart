import 'package:flutter/material.dart';
import 'package:replaner_user/common/widgets/bottom_navbar.dart';
import 'package:replaner_user/features/home/widget/footer_section.dart';
import 'package:replaner_user/features/home/widget/intro_section.dart';
import 'package:replaner_user/features/home/widget/workflow_section.dart';
import 'package:replaner_user/features/home/widget/categories_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReplanerNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.green,
                            size: 24,
                          ),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Current location",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Sultanganj, Patna",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications, size: 28),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Good Morning Text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Good Morning,\nAmit",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 1.4,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              IntroCarousel(),

              const SizedBox(height: 30),

              // 🔹 Workflow Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    OurProcessSection(),

                    const SizedBox(height: 30),

                    CategoriesSection(),

                    const SizedBox(height: 30),

                    FooterSection(),
                    Divider(thickness: 2, color: Colors.grey.shade300),
                    Center(
                      child: Image.asset(
                        "assets/logo/logo_full.png",
                        width: 240,
                        fit: BoxFit.cover,
                      ),
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
