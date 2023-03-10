import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString value = ''.obs;
  List<String> categoryList = ['카테고리1', '카테고리2', '카테고리3', '카테고리4'];

  String categoryName = '';
  late List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        categoryList[0],
        style: TextStyle(
          //color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
    Tab(
      child: Text(
        categoryList[1],
        style: TextStyle(
          //color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
    Tab(
      child: Text(
        categoryList[2],
        style: TextStyle(
          //color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
    Tab(
      child: Text(
        categoryList[3],
        style: TextStyle(
          //color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
  ];

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}