

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final List<NavBarData> navBarItems;
  const NavBar({
    super.key,
    required this.navBarItems,});

  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
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