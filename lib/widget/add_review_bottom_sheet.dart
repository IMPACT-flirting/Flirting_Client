import 'package:flutter/material.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({super.key});

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
          SizedBox(height: 30),
          Text(
            "장소로 만족도를\n점수로 매겨주세요.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  size: 38,
                  color: Color(0xFFC9CBCD),
                ),
            ],
          ),
          SizedBox(height: 33),
          Container(
            height: 150,
            width: 342,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFD9D9D9),
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: textEditingController,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                color: Color(0xFF4F4F4F),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                hintText: "내용울 입력하세요.",
                hintStyle: TextStyle(
                  color: Color(0xFFA2A0A0),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )
              ),
            ),
          ),
          const SizedBox(height: 31),

          Container(
            width: 342,
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xFF415EF8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                '작성 완료하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
