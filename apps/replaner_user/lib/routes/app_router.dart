import 'package:go_router/go_router.dart';
import 'package:replaner_user/features/auth/presentation/login_screen.dart';
import 'package:replaner_user/features/auth/presentation/username_screen.dart';
import 'package:replaner_user/features/auth/presentation/otp_screen.dart';
import 'package:replaner_user/features/home/presentation/home_screen.dart';
import 'package:replaner_user/features/onboarding/presentation/onboarding_screen.dart';
import 'package:replaner_user/features/splash/presentation/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/login/otp', builder: (context, state) => OtpScreen()),
    GoRoute(path: '/username', builder: (context, state) => UserNameScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
