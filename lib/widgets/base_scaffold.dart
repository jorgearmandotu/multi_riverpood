import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_riverpood/providers/auth_provider.dart';
import 'package:multi_riverpood/widgets/nav_bar.dart';

class BaseScaffold extends ConsumerWidget {
  final Widget body;
  final String title;

  final List<NavigationItem> navigationItems = [
    NavigationItem(icon: Icons.home, label: 'Home', route: '/'),
    NavigationItem(icon: Icons.settings, label: 'Settings', route: '/settings'),
    NavigationItem(icon: Icons.person, label: 'User', route: '/userPage'),
    NavigationItem(icon: Icons.favorite, label: 'Favorites', route: '/favorites'),
  ];

  BaseScaffold(
    {super.key
    , required this.body, this.title = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = navigationItems.indexWhere(
      (item) => item.route == location,
    );
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text(title),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).state = false;
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      bottomNavigationBar:
        MediaQuery.of(context).size.width < 640
          ? NavBar(
              navBarItems: navigationItems,

            )
          : null,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width >= 640)
              SafeArea(
                child:  NavigationRail(
                  extended: false,
                  destinations: navigationItems.map((item) => 
                    NavigationRailDestination(icon: Icon(item.icon), label: Text(item.label))).toList(),
                  selectedIndex: selectedIndex >=0 ? selectedIndex : 0,
                  onDestinationSelected: (int index) {
                    context.go(navigationItems[index].route);
                  },
                )
              ),
            Expanded(
              child: body
            )
          ],
        )
      );
  }
}


class NavigationItem {
  final IconData icon;
  final String label;
  final String route;

  NavigationItem({
    required this.icon, 
    required this.label, 
    required this.route});
}