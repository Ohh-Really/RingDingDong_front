import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/services/fcm_service.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  RxString value = ''.obs;
  List<String> categoryList = ['카테고리1', '카테고리2', '카테고리3', '카테고리4'];

  String categoryName = '';
  late List<Tab> myTabs = List<Tab>.generate(
      categoryList.length,
      (i) => Tab(
              child: Text(
            categoryList[i],
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
          )));

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: categoryList.length, vsync: this);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      var androidNotiDetails = AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
      );
      var details = NotificationDetails(
        android: androidNotiDetails,
      );
      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          details,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message);
    });

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
