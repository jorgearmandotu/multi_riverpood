


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_riverpood/pages/favorite_page.dart';
import 'package:multi_riverpood/pages/home_page.dart';
import 'package:multi_riverpood/pages/login_page.dart';
import 'package:multi_riverpood/pages/settings_page.dart';
import 'package:multi_riverpood/pages/user_page.dart';
import 'package:multi_riverpood/providers/auth_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';



@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    initialLocation: '/',

    redirect: (context, state) {
      final noAuthRoutes = ['/login'];

      final path = state.fullPath;

      if (!authState && !noAuthRoutes.contains(path)) {
        // Redirige al usuario a la página de login si intenta acceder a una ruta protegida.
        return '/login';
      }

      if (authState && path == '/login') {
        return '/';
      }

      return null;
    },
    
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
        ),
      
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
        ),
      
      GoRoute(
        path: '/settings',
        builder: (context, state) => SettingsPage(),
        ),
      
      GoRoute(
        path: '/favorites',
        builder: (context, state) => FavoritePage(),
        ),
      
      GoRoute(
        path: '/userPage',
        builder: (context, state) => UserPage(),
        ),
    ],
  );

}
