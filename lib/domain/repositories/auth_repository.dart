import 'package:ringdingdong/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String id);
}
