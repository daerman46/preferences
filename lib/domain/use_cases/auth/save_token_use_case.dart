import '../../repositories/auth_repository.dart';

class SaveTokenUseCase {
  SaveTokenUseCase({required this.authRepository});

  final AuthRepository authRepository;

  Future<void> call(String token) => authRepository.saveToken(token);
}
