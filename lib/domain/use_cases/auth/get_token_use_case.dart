import '../../repositories/auth_repository.dart';

class GetTokenUseCase {
  GetTokenUseCase({required this.authRepository});

  final AuthRepository authRepository;
}
