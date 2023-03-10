import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';
import 'package:ringdingdong/presentation/pages/main/home_page.dart';

class PostPage extends GetView<AuthController> {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFFE16F),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.off(() => HomePage());
            },
          ),
          title: Text('신고 내용'),
        ),
        body: Center(
          child: GetX(
              init: controller,
              builder: (_) {
                if (controller.hasUserData.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    children: [
                      PostHeader(context),
                      Expanded(child: PostDetail(context)),
                    ],
                  );
                }
              }),
        ));
  }

  Widget PostHeader(BuildContext context) {
    List<String> categoryList = ['카테고리1', '카테고리2', '카테고리3', '카테고리4'];

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '공사 안내',
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '서면역 1번 출구',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child:  Text(
                  '1번 출구 공사 중 우회 바람',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '생활 안전',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ));
  }

  Widget PostDetail(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffFFE16F),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    '일주일간 서면 1번 출구에서 공사가 진행된다고 합니다. 서면역을 이용하실 분들은 다른 출구를 이용하시길 바랍니다.',
                    style: TextStyle(color: Colors.black,
                    fontSize: 15),
                  ),
                )),

          ],
        ));
  }
}
