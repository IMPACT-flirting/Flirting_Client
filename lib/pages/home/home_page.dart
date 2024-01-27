import 'package:flirting/apis/auth_api.dart';
import 'package:flirting/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flirting/widget/main_select_menu_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  AuthApi().logout();
                  Navigator.pushNamed(context, "join_home");
                },
                child: const Text("로그아웃"),
              ),
              const SizedBox(
                height: 30,
              ),
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
                  child: GetBuilder<HomeController>(builder: (controller) {
                    return TableCalendar(
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                      ),
                      onDaySelected: (selectedDay, focusedDay) async {
                        controller.updateFocusedDay(focusedDay);
                        controller.updateSelectedDay(selectedDay);
                      },
                      onPageChanged: (focusedDay) {
                        controller.updateFocusedDay(focusedDay);
                      },
                      focusedDay: controller.focusedDay,
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.utc(2025, 1, 1),
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.selectedDay, day);
                      },
                    );
                  }),
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
                                  const SizedBox(height: 8),
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
              const Text(
                '추천 장소',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              for (var i = 0; i < 10; i++)
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                  ],
                ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const MainSelectMenuBottomSheet();
              },
            );
          },
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: const Color(0xFF415EF8),
              borderRadius: BorderRadius.circular(44),
              border: Border.all(
                width: 6,
                color: Colors.white,
              ),
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}
