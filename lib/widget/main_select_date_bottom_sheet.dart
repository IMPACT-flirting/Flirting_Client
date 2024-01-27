import 'package:flutter/material.dart';

class MainSelectDateBottomSheet extends StatelessWidget {
  const MainSelectDateBottomSheet({super.key});

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
          const SizedBox(height: 50),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      width: 340,
                      decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 24),
                          Text(
                            '2월 16일',
                            style: TextStyle(
                              color: Color(0xFF4F4F4F),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
