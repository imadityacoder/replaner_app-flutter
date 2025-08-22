import 'package:flutter/material.dart';
import 'package:replaner_user/common/widgets/bottom_navbar.dart';

class MybillsScreen extends StatelessWidget {
  const MybillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bills')),
      bottomNavigationBar: ReplanerNavBar(),
      body: Center(child: Text('My Bills Screen')),
    );
  }
}
