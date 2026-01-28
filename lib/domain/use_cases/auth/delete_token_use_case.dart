import 'package:preferences/domain/repositories/auth_repository.dart';

class DeleteTokenUseCase {
  DeleteTokenUseCase({required this.authRepository});

  final AuthRepository authRepository;

  Future<void> call() => authRepository.deleteToken();
}
