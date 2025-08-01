import 'package:flutter/material.dart';
import 'package:multi_riverpood/widgets/base_scaffold.dart';
import 'package:multi_riverpood/widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    return BaseScaffold(
      title: 'Home',
      body: Center(
        child: Text(
          'Welcome to the Home Page',
        ),
      ),
    ); 
  }
}