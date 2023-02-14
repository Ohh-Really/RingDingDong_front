import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/services/secure_storage.dart';
import 'package:ringdingdong/data/providers/network/apis/google_login_api.dart';
import 'package:ringdingdong/domain/entities/user.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({super.key});

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  final authController = Get.find<AuthController>();

  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setUserAgent("random");

  Future<bool> initController() {
    try {
      GoogleLoginAPI.getLoginUrl().request().then((value) {
        webViewController.loadRequest(Uri.parse(value));
      });
    } on Exception {
      return Future.value(false);
    }
    return Future.value(true);
  }

  checkHtml() async {
    String html =
        await webViewController.runJavaScriptReturningResult("window.document.getElementsByTagName('pre')[0].innerHTML;") as String;

    html = html.replaceAll("\\", "").replaceAll('"{', "{").replaceAll('}"', "}");

    if (html.contains('{"id":')) {
      final storage = Get.find<SecureStorageService>();
      User user = User.fromJson(json.decode(html));
      storage.user = user;

      authController.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Login")),
      body: FutureBuilder(
        future: initController(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == true) {
            webViewController.setNavigationDelegate(
              NavigationDelegate(onPageFinished: (url) async {
                await checkHtml();
              }),
            );
            return WebViewWidget(
              controller: webViewController,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Error!"));
          }
        },
      ),
    );
  }
}
