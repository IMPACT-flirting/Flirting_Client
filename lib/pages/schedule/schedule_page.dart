import 'package:flirting/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

bool isSwipeUp = false;

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<String> hashtags = [];
  final List<String> hashtagList = ['#분위기있는', '#럭셔리', '#가족', '#자연', '#유적'];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return SafeArea(
      child: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > -100) {
            setState(() {
              isSwipeUp = true;
            });
          } else {
            setState(() {
              isSwipeUp = false;
            });
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return TableCalendar(
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                          ),
                          onDaySelected: (DateTime selectedDay,
                              DateTime focusedDay) async {
                            controller.updateFocusedDay(focusedDay);
                            controller.updateSelectedDay(selectedDay);
                          },
                          onPageChanged: (DateTime focusedDay) {
                            controller.updateFocusedDay(focusedDay);
                          },
                          focusedDay: controller.focusedDay,
                          firstDay: DateTime.utc(2023, 1, 1),
                          lastDay: DateTime.utc(2025, 1, 1),
                          selectedDayPredicate: (DateTime day) {
                            return isSameDay(controller.selectedDay, day);
                          },
                        );
                      },
                    ),
                  ),
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
                      labelText: '제목을 입력하세요',
                      labelStyle: TextStyle(
                        color: Color(0xFFA2A0A0),
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.32,
                      ),
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
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
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 5,
                          childAspectRatio: 2,
                        ),
                        itemCount: hashtagList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (hashtags
                                    .where((element) =>
                                        element == hashtagList[index])
                                    .isNotEmpty) {
                                  hashtags.remove(hashtagList[index]);
                                } else if (hashtags.length != 3) {
                                  String hashtag = hashtagList[index];
                                  hashtags.add(hashtag);
                                }
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 10,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: hashtags
                                        .where((element) =>
                                            element == hashtagList[index])
                                        .isNotEmpty
                                    ? const Color(0xFF415EF8)
                                    : const Color(0xFFD2D3D5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                hashtagList[index].toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 200),
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
                    onTap: () {},
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
        ),
      ),
    );
  }
}
