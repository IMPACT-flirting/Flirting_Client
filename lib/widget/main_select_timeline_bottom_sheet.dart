import 'package:flutter/material.dart';

class MainSelectTimelineBottomSheet extends StatelessWidget {
  const MainSelectTimelineBottomSheet({super.key});

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
          const SizedBox(height: 40),
          SizedBox(
            height: 400,
            child: GridView.builder(
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Column(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
