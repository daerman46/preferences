import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'interfaces/auth_local_datasource.dart';

const String tokenKey = 'tokenKey';
class AuthLocalDatasourceImpl implements AuthLocalDatasource {

  FlutterSecureStorage secureStorage;

  AuthLocalDatasourceImpl({required this.secureStorage});
  
  @override
  Future<void> deleteToken() async {
    return secureStorage.delete(key: tokenKey);
  }
  
  @override
  Future<String?> getToken() async {
    return secureStorage.read(key: tokenKey);
  }
  
  @override
  Future<void> saveToken(String token) async {
    return secureStorage.write(key: tokenKey, value: token);
  }

}
