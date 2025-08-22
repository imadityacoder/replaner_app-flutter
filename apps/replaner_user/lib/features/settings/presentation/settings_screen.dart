import 'package:flutter/material.dart';
import 'package:replaner_user/common/widgets/bottom_navbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      bottomNavigationBar: ReplanerNavBar(),
      body: Center(child: Text('settings Screen')),
    );
  }
}
