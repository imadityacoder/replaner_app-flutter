import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:replaner_user/common/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        "image": 'assets/logo/logo.png',
        "title": "Welcome to Replaner",
        "desc":
            "Your one-stop platform to connect with ragmen and make recycling easy.",
      },
      {
        "image": 'assets/images/onboarding1.png',
        "title": "Instant Booking",
        "desc": "Find nearby ragmen instantly and sell your scrap easily.",
      },
      {
        "image": 'assets/images/onboarding2.png',
        "title": "Fair Pricing",
        "desc":
            "Get transparent and competitive rates for all your recyclable items.",
      },
      {
        "image": 'assets/images/onboarding3.png',
        "title": "Eco-Friendly Impact",
        "desc": "Contribute to a cleaner environment by recycling responsibly.",
      },
    ];

    return OnBoardingSlider(
      speed: 1.5,
      centerBackground: true,
      headerBackgroundColor: AppColors.secondary,
      pageBackgroundColor: AppColors.secondary,
      controllerColor: AppColors.primary,
      totalPage: pages.length,
      finishButtonText: 'Get Started',
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      hasSkip: true,
      onFinish: () {
        context.push('/login');
      },
      background: pages
          .map(
            (page) =>
                Image.asset(page["image"] as String, width: 400, height: 400),
          )
          .toList(),
      pageBodies: pages
          .map(
            (page) => _buildPageBody(
              title: page["title"] as String,
              description: page["desc"] as String,
            ),
          )
          .toList(),
    );
  }

  Widget _buildPageBody({required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 400),
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
