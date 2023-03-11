import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringdingdong/app/config/app_colors.dart';
import 'package:ringdingdong/presentation/common_widgets.dart';
import 'package:ringdingdong/presentation/pages/main/home_page.dart';

class TermPage extends StatelessWidget {
  const TermPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("약관 동의")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12.0),
              TermWidget(title: "서비스 이용 약관", text: "서비스 이용 약관 . . ."),
              TermWidget(title: "개인정보처리방침", text: "개인정보처리방침 . . ."),
              CommonButton("시작하기", onPressed: () {
                Get.offAll(() => const HomePage());
              })
            ],
          ),
        ));
  }
}

class TermWidget extends StatefulWidget {
  TermWidget({super.key, required this.title, required this.text});

  String title;
  String text;

  @override
  State<TermWidget> createState() => _TermWidgetState();
}

class _TermWidgetState extends State<TermWidget> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.black12, height: 1.0),
        Container(
          color: AppColors.primary.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8.0),
                Text(widget.text),
                Align(
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.all(6.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "전체보기",
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      )),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() => isAgree = !isAgree);
                },
                icon: isAgree ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined)),
            GestureDetector(
                onTap: () {
                  setState(() => isAgree = !isAgree);
                },
                child: Text(
                  "${widget.title} 동의",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ],
    );
  }
}
