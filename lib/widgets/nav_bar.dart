

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_riverpood/providers/navigation_provider.dart';
import 'package:multi_riverpood/routes/app_routes.dart';

class NavBar extends ConsumerWidget {
  final List<NavBarData> navBarItems;
  const NavBar({
    super.key,
    required this.navBarItems,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedIndex = ref.watch(navigationIndexProvider);
    final controller = ref.read(navigationIndexProvider.notifier);
    return  Container(
      height: 56,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...navBarItems.map((item) {
          final int itemIndex = navBarItems.indexOf(item);
          return InkWell(
            onTap: () {
              controller.setIndex(itemIndex);
              Navigator.pushNamed(context, AppRoutes.appRoutes.keys.elementAt(itemIndex+1));
            },
            child: NavBarItem(
              data: item, 
              isSelected: itemIndex  == selectedIndex,
              ),
          );
          }),
        ],
      ),
    );
  }
}

class NavBarData {
  final IconData? icon;
  final String? iconPath;

  NavBarData({
    this.icon,
    this.iconPath,
  }) {
    assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');
  }
}


class NavBarItem extends StatelessWidget {
  final NavBarData data;
  final bool isSelected;

  const NavBarItem({
    super.key,
    required this.data,
    required this.isSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15.0),
        decoration: isSelected ? BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ) : null,
        child: data.icon != null
            ? Icon(
              data.icon, 
              size: 24, 
              color: isSelected ? 
                Theme.of(context).colorScheme.onPrimary : 
                Theme.of(context).colorScheme.primary,
              )
            : Image.asset(data.iconPath!, width: 24, height: 24),
      );

  }
}