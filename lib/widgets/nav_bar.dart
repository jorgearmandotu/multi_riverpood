
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_riverpood/widgets/base_scaffold.dart';

class NavBar extends ConsumerWidget {
  final List<NavigationItem> navBarItems;
  const NavBar({
    super.key,
    required this.navBarItems,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouter.of(context).state.uri.toString();
    final selectedIndex = navBarItems.indexWhere(
      (item) => item.route == location,
    );
    return  Container(
      height: 56,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(navBarItems.length, (index) {
          final item = navBarItems[index];
          return InkWell(
            onTap: () => context.go(item.route),
            child: NavBarItem(
              data: item,
              isSelected: index == selectedIndex,
              ),
            );
          }),
        
      ),
    );
  }
}


class NavBarItem extends StatelessWidget {
  final NavigationItem data;
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
        child: Tooltip(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
              : Colors.transparent,
          ),
          message: data.label,
          child: Icon(
            data.icon,
            size: 24,
            color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
            ),
        ),
      );

  }
}