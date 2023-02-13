import 'package:ringdingdong/app/core/usecases/param_usecase.dart';
import 'package:ringdingdong/domain/entities/user.dart';
import 'package:ringdingdong/domain/repositories/auth_repository.dart';

class LoginUseCase extends ParamUseCase<User, String> {
  final AuthRepository _repo;
  LoginUseCase(this._repo);

  @override
  Future<User> execute(String id) {
    return _repo.login(id);
  }
}
