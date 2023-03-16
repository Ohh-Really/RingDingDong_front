import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/app/config/app_text_styles.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

String descriptionText =
    '\'링딩동(RingDingDong)\'은 기존 재난 문자에서 느꼈던 한계점을 보완하기 위해 기획된 서비스입니다. 큰 글씨 UI, 다양한 언어의 지원, 제스처 기반 등 사용자의 요구에 따른 데이터를 선택적으로 포함하여 안내합니다. 서비스 사용자 누구든지 정보를 제공받을 수 있으며, 동시에 정보를 제공할 수 있습니다. 특히, 동네 주민간의 안전 서비스 제공으로 주변 일상에서 불편을 겪었던 부분을 다양한 시각으로 바라볼 수 있도록 합니다.';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GetX(
                init: controller,
                builder: (_) {
                  if (controller.hasUserData.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Expanded(flex: 7, child: buildLoginHeader(context)),
                        Expanded(flex: 3, child: buildLoginButton(context)),
                      ],
                    );
                  }
                })));
  }

  Widget buildLoginHeader(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 15,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      '\u{1F514}',
                      style: TextStyle(
                        fontSize: 70,
                      ),
                    ),
                  )),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text('RingDingDong', style: AppTextStyles.title),
              ),
              Expanded(flex: 1, child: Container()),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  descriptionText,
                  style: const TextStyle(height: 2.0),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildLoginButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () async {
            await controller.login();
          },
          style: ElevatedButton.styleFrom(
            elevation: 9,
            shadowColor: Colors.grey.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(
                  FontAwesomeIcons.google,
                ),
                SizedBox(width: 8.0),
                Text("구글 로그인", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          )),
    );
  }
}
