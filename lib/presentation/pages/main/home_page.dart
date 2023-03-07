import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/home_controller.dart';
import 'package:ringdingdong/presentation/pages/report_page.dart';
import 'package:ringdingdong/presentation/pages/post_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFE16F),
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.question_mark),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
          child: GetX(
              init: controller,
              builder: (_) {
                return Column(
                  children: [
                    Expanded(flex: 1, child: HomeHeader(context)),
                    Expanded(flex: 6, child: HomeDetail()),
                    Expanded(flex: 1, child: ReportButton()),
                  ],
                );
              }),
        ));
  }

  Widget HomeHeader(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Color(0xffFFE16F),
            onPrimary: Color(0xffFFE16F),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  '부전동',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  '‣',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget HomeDetail() {
    return Column(
      children: [
        Container(
          height: kToolbarHeight + 8.0,
          padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
          decoration: BoxDecoration(
            color: Color(0xffFFE16F),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          ),
          child: TabBar(
            controller: controller.tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                color: Colors.white),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: controller.myTabs,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 5; i++) ReportList(0),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 5; i++) ReportList(1),
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    for (int i = 0; i < 5; i++) ReportList(2),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 5; i++) ReportList(3),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget ReportList(int index) {
    return InkWell(
      onTap: () {
        Get.to(() => PostPage());
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '공사 안내',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('oo아파트 상가 공사 중 우회 바람'),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: Text(controller.categoryList[index]),
                ))
          ],
        ),
      ),
    );
  }

  Widget ReportButton() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffFFE16F),
        ),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => ReportPage());
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Colors.white,
            onPrimary: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(child: Container()),
              Container(
                child: Text(
                  '신고하기${controller.value}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ));
  }
}
