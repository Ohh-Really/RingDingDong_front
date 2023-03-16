import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/app/config/app_text_styles.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';
import 'package:ringdingdong/presentation/pages/detail/views/detail_widgets.dart';
import 'package:ringdingdong/presentation/pages/main/home_page.dart';

class PostPage extends GetView<AuthController> {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.off(() => const HomePage());
            },
          ),
          title: const Text('신고 내용'),
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
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
      child: Column(
        children: [
          DetailHeaderContainer(child: const Text("공사 안내", style: TextStyle(fontWeight: FontWeight.bold))),
          DetailHeaderContainer(child: const Text("서면역 1번 출구")),
          DetailHeaderContainer(child: const Text("1번 출구 공사 중 우회 바람")),
          DetailHeaderContainer(child: const Text("생활 안전")),
        ],
      ),
    );
  }

  Widget buildPostDetail(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    '일주일간 서면 1번 출구에서 공사가 진행된다고 합니다. 서면역을 이용하실 분들은 다른 출구를 이용하시길 바랍니다.',
                    style: AppTextStyles.text,
                  ),
                )),
          ],
        ));
  }
}
