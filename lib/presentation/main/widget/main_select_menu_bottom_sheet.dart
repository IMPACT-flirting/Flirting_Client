import 'package:flirting/presentation/main/widget/main_select_date_bottom_sheet.dart';
import 'package:flirting/presentation/main/widget/main_select_timeline_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MainSelectMenuBottomSheet extends StatelessWidget {
  const MainSelectMenuBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Container(
            width: 71,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFF929292),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // bottomSheet 닫음
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const MainSelectTimelineBottomSheet();
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 61,
              decoration: BoxDecoration(
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 30),
                  Icon(
                    Icons.calendar_month,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "계획 등록하기",
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // bottomSheet 닫음
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const MainSelectDateBottomSheet();
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 61,
              decoration: BoxDecoration(
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 30),
                  Icon(
                    Icons.pin_drop,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "일정 등록하기",
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
