import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GetX(
          init: controller,
          builder: (_) {
            if (controller.hasUserData.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller.login();
                      },
                      child: const Text("Login Page")));
            }
          }),
    ));
  }
}

class PolicyAgreePage extends StatelessWidget {
  PolicyAgreePage({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("이용약관 동의")),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await authController.policyAgree();
              },
              child: const Text("동의"))),
    );
  }
}
