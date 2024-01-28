import 'package:flirting/apis/place_api.dart';
import 'package:flirting/models/comment.dart';
import 'package:flirting/models/place.dart';
import 'package:flirting/utils/arguments.dart';
import 'package:flutter/material.dart';

class MainPostingPage extends StatefulWidget {
  const MainPostingPage({super.key});

  @override
  createState() => _PostPageState();
}

class _PostPageState extends State<MainPostingPage> {
  late Place place;
  late List<Comment> comments;

  _asyncMethod() async {
    final args = ModalRoute.of(context)!.settings.arguments as PostArgument;
    var data = await PlaceApi().getPlace(args.index);
    var commentData = await PlaceApi().getComment(args.index);

    setState(() {
      place = data;
      comments = commentData;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 66,
                      ),
                      const Icon(Icons.arrow_back_ios),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        place.title,
                        style: const TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 24,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        place.address,
                        style: const TextStyle(
                          color: Color(0xFF878A8E),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              alignment: Alignment.center,
                              width: 63,
                              height: 23,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD3D4D5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                place.hashtags[i],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 0.12,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Container(
                          width: 363,
                          height: 211,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(place.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFD9D9D9)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        place.contents,
                        style: const TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                for (int i = 0; i < 10; i++)
                  Column(
                    children: [
                      Container(
                        height: 1,
                        width: 10000000000000,
                        color: const Color(0xffd9d9d9),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 7.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF415EF8),
                                      shape: OvalBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0xFFD9D9D9),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place.title,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xFF4E4E4E),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                    const Text(
                                      '4개월 전',
                                      style: TextStyle(
                                        color: Color(0xFF888B8E),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: comments.length,
                                  itemBuilder: (context, index) => Row(
                                    children: [
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        comments[i].text,
                                        style: const TextStyle(
                                          color: Color(0xFF4E4E4E),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.32,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 36,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(
              height: 100,
            )
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
                onTap: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (context) {
                  //     return const MainSelectDateBottomSheet();
                  //   },
                  // );
                  Navigator.pushNamed(context, "timeline");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 172,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF415EF8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    '일정에 추가하기',
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
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "write");
                },
                child: Container(
                  width: 162,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Color(0xFF415EF8)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    '리뷰 작성',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF415EF8),
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
    );
  }
}
