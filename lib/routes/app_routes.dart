

import 'package:flutter/material.dart';
import 'package:multi_riverpood/pages/favorite_page.dart';
import 'package:multi_riverpood/pages/home_page.dart';
import 'package:multi_riverpood/pages/login_page.dart';
import 'package:multi_riverpood/pages/settings_page.dart';
import 'package:multi_riverpood/pages/user_page.dart';

class AppRoutes {

  static const String login = 'Login';
  static const String home = 'home';
  static const String settings = 'settings';
  static const String userPage = 'userPage';
  static const String favorites = 'favorites';

  static Map<String, WidgetBuilder> appRoutes = {
  login: ( context ) => const LoginPage(),
  home: ( context ) => HomePage(),
  settings: ( context ) => const SettingsPage(),
  userPage: ( context ) => const UserPage(),
  favorites: ( context ) => const FavoritePage(),
  };

}