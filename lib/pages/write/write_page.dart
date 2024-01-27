import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends StatelessWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("뒤로가기");
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff4f4f4f),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 427,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.32,
                ),
                decoration: InputDecoration(
                  labelText: '장소의 이름을 입력하세요',
                  labelStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.32,
                  ),
                  border: InputBorder.none, // Remove the underline
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // Keep label always visible
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                print("이미지 선택");
              },
              child: Container(
                alignment: Alignment.center,
                width: 409,
                height: 225,
                decoration: const ShapeDecoration(
                  color: Color(0xFFE6E6E6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 48,
                  color: Color(0xffa2a0a0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32,
                ),
                maxLines: null,
                decoration: InputDecoration(
                  labelText: '내용을 입력하세요 ',
                  labelStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.32,
                  ),
                  border: InputBorder.none, // Remove the underline
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // Keep label always visible
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 427,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32,
                ),
                decoration: InputDecoration(
                  labelText: '장소의 이름을 입력하세요',
                  labelStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.32,
                  ),
                  border: InputBorder.none, // Remove the underline
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // Keep label always visible
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 427,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '해시태그 설정 (1개~3개)',
                    style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Container(
                          width: 78,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD2D3D5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text(
                            '#분위기있는',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 61,
                          height: 24,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF415EF8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0x4C415EF8),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '#럭셔리',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Container(
                          width: 51,
                          alignment: Alignment.center,
                          height: 24,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD2D3D5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '#가족',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Container(
                          width: 51,
                          alignment: Alignment.center,
                          height: 24,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD2D3D5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '#자연',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Container(
                          width: 51,
                          alignment: Alignment.center,
                          height: 24,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD2D3D5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            '#휴식',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: 393,
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 6.60,
              offset: Offset(0, -1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print("작성 완료하기");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 342,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF415EF8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    '작성 완료하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.15,
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
