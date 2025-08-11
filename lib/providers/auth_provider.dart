
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_riverpood/models/user.dart';

final authStateProvider = StateProvider<bool>((href) => false);

//final userProvider = StateProvider<User?>((ref) => null); 

class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
    return AuthNotifier();
  });
}