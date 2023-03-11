import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
