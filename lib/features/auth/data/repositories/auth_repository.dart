

import 'package:multi_riverpood/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:multi_riverpood/models/user.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  
  AuthRepository(this.remoteDataSource);

  Future<User> login(User user) {
    return remoteDataSource.login(user);
  }
}