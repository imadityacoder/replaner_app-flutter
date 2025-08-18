import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReplanerNavBar extends StatelessWidget {
  const ReplanerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 65,
      backgroundColor: Colors.white,
      indicatorColor: Colors.green.shade100, // ✅ highlight background
      selectedIndex: _getCurrentIndex(context),
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/my-bills');
            break;
          case 2:
            context.go('/large-collection');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
      destinations: navbarItems,
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/my-bills')) return 1;
    if (location.startsWith('/large-collection')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }
}

List<NavigationDestination> navbarItems = const [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded, color: Colors.green),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.receipt_long_outlined),
    selectedIcon: Icon(Icons.receipt_long_rounded, color: Colors.green),
    label: 'My Bills',
  ),
  NavigationDestination(
    icon: Icon(Icons.factory_outlined),
    selectedIcon: Icon(Icons.factory_rounded, color: Colors.green),
    label: 'Industry',
  ),
  NavigationDestination(
    icon: Icon(Icons.person_outline),
    selectedIcon: Icon(Icons.person, color: Colors.green),
    label: 'Profile',
  ),
];
