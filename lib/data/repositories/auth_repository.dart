import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

    storage.user = null;

    if (user == null) {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn(
          scopes: ["https://www.googleapis.com/auth/userinfo.email", "https://www.googleapis.com/auth/userinfo.profile"],
        ).signIn();

        user = User.fromJson({
          'displayName': googleUser!.displayName!,
          'email': googleUser.email,
          'id': googleUser.id,
          'photoUrl': googleUser.photoUrl,
        });

        authController.user = user;
        storage.user = user;

        GoogleSignIn().disconnect();
      } catch (e) {
        authController.user = null;
        storage.user = null;
        print(e);
      }
    }

    try {
      authController.token = await AuthAPI.login(authController.user!.id, authController.user!.email).request();

      if (authController.token.isNotEmpty) {
        Future.delayed(Duration.zero, () {
          Get.offAndToNamed('/main');
        });
      }
    } on UnauthorisedException {
      Get.offAndToNamed('/policy_agree');
    } on BadRequestException {
      Get.snackbar("로그인 실패", "알 수 없는 이유로 로그인에 실패하였습니다.", snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(8.0));
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
