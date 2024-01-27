import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flirting/models/place.dart';

class PlaceApi {
  Future<List<PreviewPlace>> getPlaceList() async {
    var options = BaseOptions(
      connectTimeout: const Duration(seconds: 5), //5s
      receiveTimeout: const Duration(seconds: 3), //15s
    );
    Dio dio = Dio(options);

    var response = await dio.get("https://youtube.anys34.com/list");
    final body = jsonDecode(response.data);

    List<PreviewPlace> list =
        body.map((i) => PreviewPlace.fromJson(i)).toList();
    return list;
  }
}
