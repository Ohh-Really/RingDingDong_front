import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/services/secure_storage.dart';
import 'package:ringdingdong/domain/entities/user.dart';
import 'package:ringdingdong/domain/usecases/auth_use_cases.dart';

class AuthController extends GetxController {
  AuthController(this._authUseCase);
  final AuthUseCase _authUseCase;

  final storage = Get.find<SecureStorageService>();
  String token = "";

  final hasUserData = false.obs;

  late User? user;

  @override
  void onInit() async {
    super.onInit();

    user = await storage.getUser();
    hasUserData.value = user != null;

    if (hasUserData.value) {
      await _authUseCase.login();
      hasUserData.value = true;
      hasUserData.refresh();
    }
  }

  login() async {
    try {
      await _authUseCase.login();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  logout() {
    storage.user = null;
    hasUserData.value = false;
  }

  policyAgree() async {
    await _authUseCase.policyAgree();
  }
}
