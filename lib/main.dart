import 'package:flutter/material.dart';
import 'package:multi_riverpood/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multisuministros',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            primary: Colors.red[700],
            onPrimary: Colors.white,
            secondary: Colors.redAccent,
            onSecondary: Colors.white,
            surface: Colors.red[50],
            onSurface: Colors.black87,
            error: Colors.red[900],
            onError: Colors.white,
          ),
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.appRoutes,
      ),
        ),
      ),
    );
  }
}
