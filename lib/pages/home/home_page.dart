import 'package:flirting/apis/user_api.dart';
import 'package:flirting/controller/home_controller.dart';
import 'package:flirting/models/place.dart';
import 'package:flirting/widget/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flirting/widget/main_select_menu_bottom_sheet.dart';

bool isSwipeUp = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PreviewPlace> placeList = [];
  String userName = "undefined";

  _loadData() async {
    const storage = FlutterSecureStorage();
    String? userId = await storage.read(key: "userId");
    String data = await UserApi().getProfile(userId!);
    debugPrint(data);

    setState(() {
      userName = data;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Size size = MediaQuery.of(context).size;

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
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$userName 님",
                          style: const TextStyle(
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
                      child: GetBuilder<HomeController>(
                        builder: (controller) {
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
                        },
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedPositioned(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 400),
                top: !isSwipeUp ? size.height * 0.2 : size.height * 0.8,
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
                  child: const DraggableBottomSheet(),
                ),
              ),
            ],
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
      ),
    );
  }
}
