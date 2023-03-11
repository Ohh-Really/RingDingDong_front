import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/app/config/app_text_styles.dart';
import 'package:ringdingdong/presentation/common_widgets.dart';

class SelectServicePage extends StatelessWidget {
  const SelectServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text("제공받을 서비스를 선택", style: AppTextStyles.header)),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: Get.height * 0.3,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/icons/service_big.png'),
                            Text(
                              "큰 글씨",
                              style: AppTextStyles.title,
                            ),
                          ],
                        ),
                      )),
                )),
                const SizedBox(width: 10.0),
                Expanded(
                    child: SizedBox(
                  height: Get.height * 0.3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/icons/service_gesture.png'),
                            Text(
                              "제스처",
                              style: AppTextStyles.title,
                            ),
                          ],
                        ),
                      )),
                )),
              ],
            ),
            const SizedBox(height: 20.0),
            CommonButton("그냥 사용해도 돼요", onPressed: () {
              Get.offAndToNamed("/login");
            }),
          ],
        ),
      ),
    );
  }
}
