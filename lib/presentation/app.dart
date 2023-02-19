import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_binding.dart';
import 'package:ringdingdong/presentation/pages/login/login_page.dart';
import 'package:ringdingdong/presentation/pages/main/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      initialBinding: AuthBinding(),
      routes: {
        '/main': (context) => MainPage(),
        '/login': (context) => const LoginPage(),
        '/policy_agree': (context) => PolicyAgreePage(),
      },
    );
  }
}
