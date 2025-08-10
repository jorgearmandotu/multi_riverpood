


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_riverpood/pages/favorite_page.dart';
import 'package:multi_riverpood/pages/home_page.dart';
import 'package:multi_riverpood/pages/login_page.dart';
import 'package:multi_riverpood/pages/settings_page.dart';
import 'package:multi_riverpood/pages/user_page.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';


@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
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
