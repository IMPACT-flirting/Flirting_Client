import 'dart:io';

import 'package:flirting/apis/place_api.dart';
import 'package:flirting/controller/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final List<String> hashtags = [];
  final List<String> hashtagList = ['#분위기있는', '#럭셔리', '#가족', '#자연', '#유적'];

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(ImageController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff4f4f4f),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: TextField(
                controller: _titleController,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.32,
                ),
                decoration: const InputDecoration(
                  labelText: '제목을 입력하세요',
                  labelStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.32,
                  ),
                  border: InputBorder.none, // Remove the underline
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // Keep label always visible
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<ImageController>(builder: (controller) {
              return GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    controller.updateImage(image!);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 409,
                    height: 225,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE6E6E6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      ),
                    ),
                    child: controller.image == null
                        ? const Icon(
                            Icons.add,
                            size: 48,
                            color: Color(0xffa2a0a0),
                          )
                        : SizedBox(
                            width: 409,
                            height: 225,
                            child: Image.file(
                              File(controller.image!.path),
                              fit: BoxFit.cover,
                            )),
                  ));
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: TextField(
                controller: _contentController,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32,
                ),
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: '내용을 입력하세요 ',
                  labelStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.32,
                  ),
                  border: InputBorder.none, // Remove the underline
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // Keep label always visible
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: TextField(
                controller: _addressController,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32,
                ),
                decoration: const InputDecoration(
                  labelText: '장소의 이름을 입력하세요',
                  labelStyle: TextStyle(
                    color: Color(0xFFA2A0A0),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.32,
                  ),
                  border: InputBorder.none, // Remove the underline
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // Keep label always visible
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 1개의 행에 항목을 3개씩
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
                                    borderRadius: BorderRadius.circular(8)),
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
                            ));
                      }),
                  const SizedBox(
                    height: 200,
                  ),
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
              GetBuilder<ImageController>(builder: (controller) {
                return GestureDetector(
                  onTap: () async {
                    String res = await PlaceApi().savePlace(
                        _titleController.text,
                        _contentController.text,
                        _addressController.text,
                        hashtags);
                    await PlaceApi()
                        .saveImage(res.toString(), controller.image!.path);

                    _titleController.dispose();
                    _contentController.dispose();
                    _addressController.dispose();

                    if (!context.mounted) return;

                    Navigator.pushNamed(context, "home");
                  },
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
