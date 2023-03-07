import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';
import 'package:ringdingdong/presentation/pages/main/home_page.dart';

class ReportPage extends GetView<AuthController> {
  const ReportPage({super.key});

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
          title: Text('신고하기'),
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
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                margin:
                EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '제목을 작성해주세요.',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                margin:
                EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '어디서 일어난 일인가요?',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                margin:
                EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffFFE16F),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '한 줄로 요약해주세요.',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              DropdownButton(
                hint: Text("카테고리를 선택해주세요. "),
                items: [],
                onChanged: (newValue) {},
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
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '신고 내용을 작성해주세요.',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    maxLines: 20,
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                      onPrimary: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                          child: Text(
                            '신고하기',
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
                  ),
                )),
          ],
        ));
  }
}
