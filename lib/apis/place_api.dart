import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flirting/models/comment.dart';
import 'package:flirting/models/place.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PlaceApi {
  Future<List<PreviewPlace>> getPlaceList() async {
    try {
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      var response = await dio.get("https://youtube.anys34.com/list");
      final body = response.data;

      if (body.length == 0) return [];

      List<PreviewPlace> list =
          body.map((i) => PreviewPlace.fromJson(i)).toList();
      return list;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> savePlace(String title, String contents, String address,
      List<String> hashtags) async {
    try {
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      const storage = FlutterSecureStorage();
      String? userId = await storage.read(key: "userId");

      var body = json.encode({
        'userId': userId!,
        'title': title,
        "contents": contents,
        "address": address,
        "hashtags": hashtags,
      });

      var response = await dio.post(
        "https://youtube.anys34.com/save",
        data: body,
        options: Options(contentType: Headers.jsonContentType),
      );

      return response.data.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> saveImage(String placeId, dynamic image) async {
    var dio = Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;

      await dio.post("https://youtube.anys34.com/picture",
          data: FormData.fromMap(
            {"id": placeId, "file": await MultipartFile.fromFile(image)},
          ));

      return;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> saveCommentAboutPlace(String id, String commentContents) async {
    try {
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      var body = json.encode({"id": id, "comment": commentContents});

      await dio.post(
        "https://youtube.anys34.com/comment",
        data: body,
        options: Options(contentType: Headers.jsonContentType),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Comment> getComment(String commentId) async {
    try {
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      var response =
          await dio.get("https://youtube.anys34.com/comment/$commentId");

      return Comment.fromJson(jsonDecode(response.data));
    } catch (e) {
      throw e.toString();
    }
  }
}
