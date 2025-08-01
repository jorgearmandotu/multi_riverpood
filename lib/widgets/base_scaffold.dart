import 'package:flutter/material.dart';
import 'package:multi_riverpood/widgets/nav_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  final List<NavigationItem> navigationItems = [
    NavigationItem(icon: Icons.home, label: 'Home'),
    NavigationItem(icon: Icons.settings, label: 'Settings'),
    NavigationItem(icon: Icons.person, label: 'User'),
    NavigationItem(icon: Icons.favorite, label: 'Favorites'),
  ];

  BaseScaffold(
    {super.key
    , required this.body, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text(title),
          actions: [
            IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      bottomNavigationBar:
        MediaQuery.of(context).size.width < 640
          ? NavBar(
              navBarItems: navigationItems.map((item) => NavBarData(icon: item.icon)).toList(),
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
                  selectedIndex: 0,
                  onDestinationSelected: (int index) {
                          
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

  NavigationItem({required this.icon, required this.label});
}