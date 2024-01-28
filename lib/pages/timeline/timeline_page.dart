import 'package:flirting/apis/place_api.dart';
import 'package:flirting/apis/timeline_api.dart';
import 'package:flirting/controller/home_controller.dart';
import 'package:flirting/models/place.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final List<String> hashtags = [
    "분위기 있는",
    "럭셔리",
    "조용한",
    "왁자지껄",
    "가족",
    "친구",
    "연인",
    "자연",
    "맛집",
    "풍경",
    "포토존",
    "숨은명소",
    "전통",
    "트렌드",
    "탁 트인"
  ];
  final List<String> selectedHashTags = [];

  final _titleController = TextEditingController();
  List<PreviewPlace> placeList = [];
  List<PreviewPlace> selectedList = [];

  _asyncMethod() async {
    var data = await PlaceApi().getPlaceList();

    setState(() {
      placeList = data;
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
    Size size = MediaQuery.of(context).size;
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
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          decoration:
                              const InputDecoration(labelText: "제목을 입력해주세요"),
                          style: const TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.edit_outlined),
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hashtags.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedHashTags
                                    .where(
                                        (element) => element == hashtags[index])
                                    .isNotEmpty) {
                                  selectedHashTags.remove(hashtags[index]);
                                } else if (hashtags.length != 3) {
                                  String hashtag = hashtags[index];
                                  selectedHashTags.add(hashtag);
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              width: 70,
                              height: 10,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: selectedHashTags
                                        .where((element) =>
                                            element == hashtags[index])
                                        .isNotEmpty
                                    ? const Color(0xFF415EF8)
                                    : const Color(0xFFD2D3D5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                hashtags[index].toString(),
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
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      var data = selectedList[index];
                                      setState(() {
                                        placeList.add(data);
                                        selectedList.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      width: 130,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.network(
                                          placeList[index].imageUrl),
                                    )),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(children: [
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      placeList[index].title,
                                      style: const TextStyle(
                                        fontFamily: "Pretendard",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      selectedList[index].contents,
                                      style: const TextStyle(
                                          fontFamily: "Pretendard",
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "추천 장소",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: placeList.length,
                    itemBuilder: (context, index) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        var data = placeList[index];
                                        setState(() {
                                          selectedList.add(data);
                                          placeList.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        width: 130,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Image.network(
                                            placeList[index].imageUrl),
                                      )),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(children: [
                                    SizedBox(
                                      width: size.width * 0.3,
                                      child: Text(
                                        placeList[index].title,
                                        style: const TextStyle(
                                          fontFamily: "Pretendard",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.3,
                                      child: Text(
                                        placeList[index].contents,
                                        style: const TextStyle(
                                            fontFamily: "Pretendard",
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                            ),
                            const SizedBox(height: 11),
                          ]);
                    },
                  ),
                ],
              )),
        ),
        floatingActionButton: GetBuilder<HomeController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () async {
                var title = _titleController.text;
                var date = DateFormat("yyyyMMdd").format(controller.focusedDay);

                await TimeLineApi()
                    .saveTimeline(title, date, hashtags, selectedList);

                _titleController.dispose();
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
                  Icons.save,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            );
          },
        ));
  }
}
