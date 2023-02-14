import 'package:ringdingdong/app/core/usecases/auth_usecase.dart';
import 'package:ringdingdong/domain/repositories/auth_repository.dart';

class AuthUseCase extends AuthUseCases<void> {
  final AuthRepository _repo;
  AuthUseCase(this._repo);

  @override
  Future<void> login() {
    _repo.login();

    return Future.value(null);
  }

  @override
  Future<void> policyAgree() {
    _repo.policyAgree();

    return Future.value(null);
  }
}
