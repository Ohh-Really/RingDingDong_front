import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
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
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.question_mark),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Get.toNamed('/my_page');
              },
            )
          ],
        ),
        body: Center(
          child: GetX(
              init: controller,
              builder: (_) {
                return Column(
                  children: [
                    Expanded(flex: 1, child: buildHomeHeaderWidget(context)),
                    Expanded(flex: 6, child: buildHomeDetail()),
                    Expanded(flex: 1, child: buildReportButton()),
                  ],
                );
              }),
        ));
  }

  Widget buildHomeHeaderWidget(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
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
                margin: const EdgeInsets.only(right: 20),
                child: const Text(
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

  Widget buildHomeDetail() {
    return Column(
      children: [
        Container(
          height: kToolbarHeight + 8.0,
          padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          ),
          child: TabBar(
            controller: controller.tabController,
            indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)), color: Colors.white),
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 5; i++) buildReportList(0),
                      const SizedBox(height: 20.0),
                    ],
                  )),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 5; i++) buildReportList(1),
                      const SizedBox(height: 20.0),
                    ],
                  )),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    for (int i = 0; i < 5; i++) buildReportList(2),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 5; i++) buildReportList(3),
                      const SizedBox(height: 20.0),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildReportList(int index) {
    return InkWell(
      onTap: () {
        Get.to(() => const PostPage());
      },
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '공사 안내',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('oo아파트 상가 공사 중 우회 바람'),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: Text(controller.categoryList[index]),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildReportButton() {
    return Container(
        decoration: BoxDecoration(color: AppColors.primary),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const ReportPage());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '신고하기${controller.value}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
