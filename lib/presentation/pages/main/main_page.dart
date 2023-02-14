import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Name : ${authController.user!.name}"),
          Text("OAuth2 ID : ${authController.user!.id}"),
          Text("Email : ${authController.user!.email}"),
          Text("JWT : ${authController.token}")
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.logout),
          onPressed: () {
            authController.logout();
            Get.offAllNamed('/login');
          }),
    );
  }
}
