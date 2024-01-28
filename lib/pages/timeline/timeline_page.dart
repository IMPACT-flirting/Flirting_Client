import 'package:flirting/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
              GetBuilder<HomeController>(builder: (controller) {
                return Text(
                  DateFormat.yMMMd().format(controller.focusedDay),
                  style: const TextStyle(
                    color: Color(0xFF929292),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                );
              }),
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
                  GetBuilder<HomeController>(builder: (controller) {
                    return Text(
                      DateFormat.yMMMd().format(controller.focusedDay),
                      style: const TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
