import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/app/config/app_text_styles.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';
import 'package:ringdingdong/presentation/pages/detail/views/detail_widgets.dart';
import 'package:ringdingdong/presentation/pages/main/home_page.dart';

class ReportPage extends GetView<AuthController> {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFE16F),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.off(() => const HomePage());
            },
          ),
          title: const Text('신고하기'),
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
                      buildPostHeader(context),
                      Expanded(child: buildPostDetail(context)),
                    ],
                  );
                }
              }),
        ));
  }

  Widget buildPostHeader(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
          child: Column(
            children: [
              DetailHeaderContainer(
                  padding: const EdgeInsets.only(left: 30),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: const TextField(
                    decoration: InputDecoration(hintText: '제목을 작성해주세요.'),
                  )),
              DetailHeaderContainer(
                  padding: const EdgeInsets.only(left: 30),
                  child: const TextField(
                    decoration: InputDecoration(hintText: '어디서 일어난 일인가요?'),
                  )),
              DetailHeaderContainer(
                  padding: const EdgeInsets.only(left: 30),
                  child: const TextField(
                    decoration: InputDecoration(hintText: '한 줄로 요약해주세요.'),
                  )),
              DropdownButton(
                hint: const Text("카테고리를 선택해주세요. "),
                items: [],
                onChanged: (newValue) {},
              ),
            ],
          ),
        ));
  }

  Widget buildPostDetail(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '신고 내용을 작성해주세요.',
                    ),
                    maxLines: 20,
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => const HomePage());
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text('신고하기', style: AppTextStyles.button),
                  ),
                )),
          ],
        ));
  }
}
