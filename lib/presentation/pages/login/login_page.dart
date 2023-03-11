import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/presentation/controllers/auth/auth_controller.dart';

String Description =
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
                  Expanded(flex: 8, child: LoginHeader(context)),
                  Expanded(flex: 3, child: LoginDetail(context)),
                ],
              );
            }
          }),
    ));
  }

  Widget LoginHeader(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffFFE16F),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 15,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '\u{1F514}',
                      style: TextStyle(
                        fontSize: 70,
                      ),
                    ),
                  )),
              Container(
                child: Text(
                  'RingDingDong',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.bottomLeft,
              ),
              Expanded(flex: 1, child: Container()),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  Description,
                  style: TextStyle(height: 2.8),
                ),
              ),
            ],
          ),
        ));
  }

  Widget LoginDetail(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () async {
            //await controller.login();
            Get.toNamed('/term');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 9,
            shadowColor: Colors.grey.withOpacity(0.5),
          ),
          child: const Text(
            "Log In",
            style: TextStyle(
              color: Colors.black,
            ),
          )),
    );
  }
}
