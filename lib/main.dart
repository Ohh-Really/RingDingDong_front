import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/di/dependency.dart';
import 'package:ringdingdong/app/services/secure_storage.dart';
import 'package:ringdingdong/presentation/app.dart';

import 'firebase_options.dart';

void main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const App());
}

initServices() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Get.putAsync(() => SecureStorageService().init());
}
