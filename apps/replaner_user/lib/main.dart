import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:replaner_user/common/theme/app_theme.dart';
import 'package:replaner_user/firebase_options.dart';
import 'package:replaner_user/routes/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ReplanerUserApp());
}

class ReplanerUserApp extends StatelessWidget {
  const ReplanerUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Replaner User',
      routerConfig: appRouter,
      theme: AppTheme.lightTheme,
    );
  }
}
