

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_riverpood/pages/favorite_page.dart';
import 'package:multi_riverpood/pages/home_page.dart';
import 'package:multi_riverpood/pages/login_page.dart';
import 'package:multi_riverpood/pages/settings_page.dart';
import 'package:multi_riverpood/pages/user_page.dart';
import 'package:multi_riverpood/providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(authProvider);
  final user = ref.watch(userProvider);



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

    redirect: ( BuildContext context, GoRouterState state) {
      final noAuthPaths = ['/', '/login', '/settings', '/favorites', '/userPage'];

      final authPaths = ['/', '/settings', '/favorites', '/userPage'];

      if(!isLoggedIn) {
        return '/';
      }
      return null;
    }
  );

});


// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     _subscription = stream.asBroadcastStream().listen((_) {
//       notifyListeners();
//     });
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }