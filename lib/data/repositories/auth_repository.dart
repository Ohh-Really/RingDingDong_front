import 'package:ringdingdong/domain/entities/user.dart';
import 'package:ringdingdong/domain/repositories/auth_repository.dart';

class AuthRepositoryIml extends AuthRepository {
  @override
  Future<User> login(String id) async {
    return User();
  }
}
