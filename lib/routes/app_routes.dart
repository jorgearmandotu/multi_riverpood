

import 'package:flutter/material.dart';
import 'package:multi_riverpood/pages/home_page.dart';
import 'package:multi_riverpood/pages/login_page.dart';

class AppRoutes {

  static const String login = 'Login';
  static const String home = 'home';
  static const String settings = 'settings';

  static Map<String, WidgetBuilder> appRoutes = {
  login: ( context ) => const LoginPage(),
  home: ( context ) => HomePage(),
  //settings: ( context ) => const SettingsPage(),
  };

}