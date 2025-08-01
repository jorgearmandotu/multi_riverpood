
import 'package:flutter/material.dart';
import 'package:multi_riverpood/widgets/base_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: Center(
      child: Text(
        'Settings Page',
      ),
    ), title: 'Settings');
  }
}