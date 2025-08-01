import 'package:flutter/material.dart';
import 'package:multi_riverpood/widgets/base_scaffold.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Favorites',
      body: Center(
        child: Text('Favorite page'),
      )
    );
  }
}