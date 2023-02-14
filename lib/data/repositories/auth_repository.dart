import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/services/secure_storage.dart';
import 'package:ringdingdong/data/providers/network/api_provider.dart';
import 'package:ringdingdong/data/providers/network/apis/auth_api.dart';
import 'package:ringdingdong/domain/entities/user.dart';
import 'package:ringdingdong/domain/repositories/auth_repository.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

class AuthRepositoryIml extends AuthRepository {
  final storage = Get.find<SecureStorageService>();

  @override
  Future<void> login() async {
    final authController = Get.find<AuthController>();
    User? user = await storage.getUser();

    if (user == null) {
      Get.toNamed('/google_login');
    } else {
      try {
        authController.token = await AuthAPI.login(user.id, user.email).request();

        if (authController.token.isNotEmpty) {
          Future.delayed(Duration.zero, () {
            Get.offAndToNamed('/main');
          });
        }
      } on UnauthorisedException {
        Get.offAndToNamed('/policy_agree');
      }
    }
  }

  @override
  Future<void> policyAgree() async {
    User? user = await storage.getUser();

    try {
      await AuthAPI.policyAgree(user!.id, user.email).request();
      Get.offAllNamed("/main");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
