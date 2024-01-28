import 'package:flirting/apis/place_api.dart';
import 'package:flirting/models/place.dart';
import 'package:flirting/utils/arguments.dart';
import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  List<PreviewPlace> placeList = [];

  _loadData() async {
    List<PreviewPlace> plaecListData = await PlaceApi().getPlaceList();

    setState(() {
      placeList = plaecListData;
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
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
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
                    itemCount: placeList.length,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: Text(
              '추천 장소',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4F4F4F),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          InkWell(
            child: const Text("장소 등록"),
            onTap: () {
              Navigator.pushNamed(
                context,
                "write",
              );
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: SizedBox(
              height: size.height * 0.4,
              child: ListView.builder(
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
                                  Navigator.pushNamed(context, "post",
                                      arguments: PostArgument(
                                          placeList[index].placeId));
                                },
                                child: Container(
                                  width: 130,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                      Image.network(placeList[index].imageUrl),
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
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
