import 'package:flirting/presentation/login/login_page.dart';
import 'package:flirting/presentation/login/signUp_page.dart';
import 'package:flutter/material.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "당신의 휴일을\n채워드릴게요",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4f4f4f),
                  height: 1.2,
                  letterSpacing: -0.32),
            ),
            const SizedBox(
              height: 34,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  print("회원가입");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SignUp(),
                    ),
                  );
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
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Login(),
                    ),
                  );
                },
                child: const Text(
                  "이미 계정이 있으신가요?",
                  style: TextStyle(
                    color: Color(0xffa2a0a0),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.32,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 154,
            )
          ],
        ),
      ),
    );
  }
}
