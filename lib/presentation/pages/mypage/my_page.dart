import 'package:flutter/material.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/app/config/app_text_styles.dart';
import 'package:ringdingdong/presentation/common_widgets.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내 정보"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network("https://avatars.githubusercontent.com/u/3811039?v=4")),
                  ),
                  const SizedBox(width: 20.0),
                  Flexible(flex: 7, child: Text("UserName", style: AppTextStyles.title)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(30.0)),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                              decoration: const BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/badges/badge_$index.png"),
                              ))),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1 / 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton("받고 싶은 재난 정보 수정", onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonButton("설정", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
