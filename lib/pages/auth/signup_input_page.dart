import 'package:flirting/apis/auth_api.dart';
import 'package:flirting/utils/auth_animation.dart';
import 'package:flirting/utils/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<AuthAnimation> {
  SignUpPage({super.key});

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(AuthAnimation());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              '회원가입',
              style: TextStyle(
                color: Color(0xFF4E4E4E),
                fontSize: 32,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.32,
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xff415EF8),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1,
                  ),
                ),
                labelText: '아이디를 입력해주세요',
                labelStyle: const TextStyle(
                  color: Color(0xFF4f4f4f),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xff415EF8),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1,
                  ),
                ),
                labelText: '이름을 입력해주세요',
                labelStyle: const TextStyle(
                  color: Color(0xFF4f4f4f),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xff415EF8),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1,
                  ),
                ),
                labelText: '비밀번호를 입력해주세요',
                labelStyle: const TextStyle(
                  color: Color(0xFF4f4f4f),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextField(
              controller: _passwordConfirmController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xff415EF8),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1,
                  ),
                ),
                labelText: '비밀번호를 다시 입력해주세요',
                labelStyle: const TextStyle(
                  color: Color(0xFF4f4f4f),
                ),
              ),
            ),
            const SizedBox(
              height: 263,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  CustomResponse response = await AuthApi().signUp(
                      _idController.text,
                      _passwordController.text,
                      _passwordConfirmController.text,
                      _nameController.text);

                  if (!context.mounted) return;
                  if (response.isSuccess == false) {
                    Get.snackbar("회원가입 실패", response.message);
                    return;
                  }

                  Navigator.pushNamed(context, "login");
                },
                child: Container(
                  width: 342,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xff415EF8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "회원가입",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Pretendard',
                      color: Colors.white,
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
