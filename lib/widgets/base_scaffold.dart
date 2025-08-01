import 'package:flutter/material.dart';
import 'package:multi_riverpood/widgets/nav_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  const BaseScaffold(
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
              navBarItems: [
                NavBarData(icon: Icons.home),
                NavBarData(icon: Icons.settings),
                NavBarData(icon: Icons.person),
                NavBarData(icon: Icons.favorite),
              ],

            )
          : null,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width >= 640)
              SafeArea(
                child:  NavigationRail(
                  extended: false,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('settings'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      label: Text('User'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
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