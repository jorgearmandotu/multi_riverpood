import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_riverpood/routes/app_router.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return Center(
        child: MaterialApp.router(
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
        routerConfig: appRouter,
      ),    
    );
  }
}
