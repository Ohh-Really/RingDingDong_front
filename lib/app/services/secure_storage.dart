import 'package:get/get.dart';
import 'package:ringdingdong/domain/entities/user.dart';

class SecureStorageService extends GetxService {
  Future<SecureStorageService> init() async {
    // TODO : Implement Secure Storage Service
    return SecureStorageService();
  }

  User? get user {
    return User();
  }

  set user(User? user) {}
}
