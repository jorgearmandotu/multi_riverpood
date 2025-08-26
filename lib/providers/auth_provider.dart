
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:multi_riverpood/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:multi_riverpood/features/auth/data/repositories/auth_repository.dart';
import 'package:multi_riverpood/models/user.dart';

final authStateProvider = StateProvider<bool>((href) => false);

final httpClientProvider = Provider((ref) => http.Client());

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(ref.watch(httpClientProvider))
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(ref.watch(authRemoteDataSourceProvider)),
);


// Estado de autenticación
class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, User? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

// StateNotifier para login
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;
  AuthNotifier(this.repository) : super(AuthState());

  Future<void> login(User userLogin) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await repository.login(userLogin);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// Provider del Notifier
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});


//**************** */
// class AuthNotifier extends ChangeNotifier {
//   bool _isLoggedIn = false;

//   bool get isLoggedIn => _isLoggedIn;

//   void login( User user) {
//     _isLoggedIn = true;
//     notifyListeners();
//   }

  // final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  //   return AuthNotifier();
  // });
//}