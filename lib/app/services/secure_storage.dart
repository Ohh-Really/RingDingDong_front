import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/domain/entities/user.dart';

class SecureStorageService extends GetxService {
  FlutterSecureStorage? _storage;

  Future<SecureStorageService> init() async {
    _storage = const FlutterSecureStorage();
    return this;
  }

  Future<User?> getUser() async {
    final user = await _storage?.read(key: 'user');
    if (user != null) {
      return User.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }

  set user(User? user) {
    if (user != null) {
      _storage!.write(key: 'user', value: json.encode(user.toJson()));
    } else {
      _storage!.delete(key: 'user');
    }
  }

  set fcmToken(String token) {
    _storage!.write(key: 'token', value: token);
  }
}
