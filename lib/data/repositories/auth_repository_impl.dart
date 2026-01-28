import 'package:preferences/data/datasources/interfaces/auth_local_datasource.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authLocalDatasource});

  final AuthLocalDatasource authLocalDatasource;
  
  @override
  Future<void> deleteToken() {
    return authLocalDatasource.deleteToken();
  }
  
  @override
  Future<String?> getToken() {
    return authLocalDatasource.getToken();
  }
  
  @override
  Future<void> saveToken(String token) {
    return authLocalDatasource.saveToken(token);
  }
}
