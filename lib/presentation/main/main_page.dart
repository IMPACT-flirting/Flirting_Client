import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 81),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "김수민 님",
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFD9D9D9),
                      ),
                      shape: BoxShape.circle,
                      color: const Color(0xFF415EF8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2025, 1, 1),
                ),
              ),
            ),
            const SizedBox(height: 42),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: const Color(0xFFD9D9D9),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '다가오는 휴일',
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    height: 134,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 155,
                                  height: 106,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE3E7FE),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 11),
                                const SizedBox(
                                  width: 155,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '2월 15일 ~ 2월 17일',
                                        style: TextStyle(
                                          color: Color(0xFF4F4F4F),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '3일',
                                        style: TextStyle(
                                          color: Color(0xFF929292),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: index == 5 - 1 ? 0 : 11),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '추천 장소',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(itemBuilder: (context, inde))
          ],
        ),
      ),
    );
  }
}
