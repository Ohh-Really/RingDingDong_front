import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/services/secure_storage.dart';
import 'package:ringdingdong/domain/entities/user.dart';
import 'package:ringdingdong/domain/usercases/login_use_case.dart';

class AuthController extends GetxController {
  AuthController(this._loginUseCase);
  final LoginUseCase _loginUseCase;
  final storage = Get.find<SecureStorageService>();
  var hasUserData = false.obs;

  User? get user => storage.user;

  @override
  void onInit() async {
    super.onInit();
    hasUserData.value = storage.user != null;
  }

  loginWith(String id) async {
    try {
      final user = await _loginUseCase.execute(id);
      storage.user = user;
      hasUserData.value = true;
      hasUserData.refresh();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  logout() {
    storage.user = null;
    hasUserData.value = false;
  }
}
