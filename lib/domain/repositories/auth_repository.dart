abstract interface class AuthRepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

