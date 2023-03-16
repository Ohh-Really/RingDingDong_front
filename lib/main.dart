import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/di/dependency.dart';
import 'package:ringdingdong/app/services/fcm_service.dart';
import 'package:ringdingdong/app/services/secure_storage.dart';
import 'package:ringdingdong/presentation/app.dart';

void main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}

initServices() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Get.putAsync(() => FCMService().init());
  await Get.putAsync(() => SecureStorageService().init());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}
