import 'package:flutter/material.dart';
import 'package:replaner_user/common/widgets/bottom_navbar.dart';

class BulkScrapScreen extends StatelessWidget {
  const BulkScrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bulk Scrap')),
      bottomNavigationBar: ReplanerNavBar(),
      body: Center(child: Text('Bulk Scrap Screen')),
    );
  }
}
