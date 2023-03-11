import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_binding.dart';
import 'package:ringdingdong/presentation/pages/login/login_page.dart';
import 'package:ringdingdong/presentation/pages/login/select_service_page.dart';
import 'package:ringdingdong/presentation/pages/login/term_page.dart';
import 'package:ringdingdong/presentation/pages/mypage/my_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return GetMaterialApp(
      initialRoute: '/service_select',
      initialBinding: AuthBinding(),
      theme: theme.copyWith(
          appBarTheme: AppBarTheme(
            color: AppColors.primary,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: theme.colorScheme.copyWith(secondary: AppColors.primary),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
                elevation: 0.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
          )),
      routes: {
        '/login': (context) => const LoginPage(),
        '/my_page': (context) => const MyPage(),
        '/service_select': (context) => const SelectServicePage(),
        '/term': (context) => const TermPage(),
      },
    );
  }
}
