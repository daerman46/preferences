import 'package:preferences/data/datasources/interfaces/auth_local_datasource.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authLocalDatasource});

  final AuthLocalDatasource authLocalDatasource;
}
