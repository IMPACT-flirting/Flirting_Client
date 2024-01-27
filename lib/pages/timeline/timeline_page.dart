import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    '휴일의 제목',
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.edit_outlined),
                ],
              ),
              const SizedBox(height: 7),
              const Text(
                '2월 15일 ~ 2월 17일',
                style: TextStyle(
                  color: Color(0xFF929292),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  for (var i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        width: 63,
                        height: 23,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD3D4D5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '#해시태그',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    '2월 15일',
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Color(0xFFD9D9D9),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '글 제목',
                                            style: TextStyle(
                                                color: Color(0xFF4F4F4F),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 7),
                                          Row(
                                            children: [
                                              Text(
                                                '4.0',
                                                style: TextStyle(
                                                  color: Color(0xFF888B8E),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              for (int i = 0; i < 5; i++)
                                                Icon(
                                                  Icons.star,
                                                  size: 12,
                                                  color: Color(0xFFC9CBCD),
                                                ),
                                              SizedBox(width: 4),
                                              Text(
                                                '(9,990)',
                                                style: TextStyle(
                                                  color: Color(0xFF888B8E),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            '쇼핑, 레저 ~~~~~~~~~~',
                                            style: TextStyle(
                                              color: Color(0xFF929292),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: index == 2 - 1 ? 0 : 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
