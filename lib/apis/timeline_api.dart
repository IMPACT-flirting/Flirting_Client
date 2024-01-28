import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flirting/models/place.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TimeLineApi {
  Future<void> saveTimeline(String title, String date, List<String> hashtags,
      List<PreviewPlace> spots) async {
    try {
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      const storage = FlutterSecureStorage();
      var userId = await storage.read(key: "userId");

      var body = json.encode({
        "userId": userId,
        "title": title,
        "date": date,
        "hashtag": hashtags
      });
      await dio.post("https://youtube.anys34.com/timeline/save",
          data: body,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));

      return;
    } catch (e) {
      throw e.toString();
    }
  }
}
