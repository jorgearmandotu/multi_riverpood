import 'package:flutter/material.dart';
import 'package:multi_riverpood/widgets/base_scaffold.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'User',
      body: Center(child: Text('User page'),
      ),
    );
  }
}