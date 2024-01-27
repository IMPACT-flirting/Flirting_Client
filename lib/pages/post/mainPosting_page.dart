import 'package:flutter/material.dart';

class MainPostingPage extends StatelessWidget {
  const MainPostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 66,
                      ),
                      const Icon(Icons.arrow_back_ios),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        '장소의제목은몇글자까지',
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 24,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            '4.0',
                            style: TextStyle(
                              color: Color(0xFF878A8E),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.32,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          for (int i = 0; i < 4; i++)
                            Container(
                              width: 14,
                              height: 14,
                              decoration: const ShapeDecoration(
                                color: Color(0xffF6BA46),
                                shape: StarBorder(
                                  points: 5,
                                  innerRadiusRatio: 0.46,
                                  pointRounding: 0.40,
                                  valleyRounding: 0,
                                  rotation: 0,
                                  squash: 0,
                                ),
                              ),
                            ),
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFc9cbcd),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.46,
                                pointRounding: 0.40,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '(3,450)',
                            style: TextStyle(
                              color: Color(0xFF878A8E),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: -0.32,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '여기는 주소인데  - 주소는몇글자까지가능?',
                        style: TextStyle(
                          color: Color(0xFF878A8E),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              alignment: Alignment.center,
                              width: 63,
                              height: 23,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD3D4D5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text(
                                '#해시태그',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 0.12,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Container(
                          width: 363,
                          height: 211,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/363x211"),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        '여기는 무엇을 할 수 있는 장소이며\n올 때 마실것좀 사오라 해야겠네요 목말라서 하지만 내용을\n적어야 하니까 뭐라도 쓰긴 하겠습니다.\n이 프로젝트 이대로 괜찮은걸까요?\n아니, 만들 수는 있을까요? (플러팅. 이대로. 괜찮은가..)',
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                for (int i = 0; i < 10; i++)
                  Column(
                    children: [
                      Container(
                        height: 1,
                        width: 10000000000000,
                        color: const Color(0xffd9d9d9),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 7.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF415EF8),
                                      shape: OvalBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0xFFD9D9D9),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '장소의제목은몇글자까지',
                                      style: TextStyle(
                                        color: Color(0xFF4E4E4E),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                    Text(
                                      '4개월 전',
                                      style: TextStyle(
                                        color: Color(0xFF888B8E),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Container(
                                    width: 14,
                                    height: 14,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFF5B945),
                                      shape: StarBorder(
                                        points: 5,
                                        innerRadiusRatio: 0.46,
                                        pointRounding: 0.40,
                                        valleyRounding: 0,
                                        rotation: 0,
                                        squash: 0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            const Text(
                              '저희가 편의점을 갔는데 닫혀있었어요. 여기 너무 좋습니다 편의점도 없고 너무 좋아요!!!',
                              style: TextStyle(
                                color: Color(0xFF4E4E4E),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.32,
                              ),
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(
              height: 100,
            )
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
                  print("일정에 추가하기");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 172,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF415EF8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    '일정에 추가하기',
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
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  print("리뷰 작성");
                },
                child: Container(
                  width: 162,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Color(0xFF415EF8)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    '리뷰 작성',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF415EF8),
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
