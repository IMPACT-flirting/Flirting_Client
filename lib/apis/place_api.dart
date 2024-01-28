import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flirting/models/comment.dart';
import 'package:flirting/models/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PlaceApi {
  Future<Place> getPlace(int placeId) async {
    try {
      var response =
          await http.get(Uri.parse("https://youtube.anys34.com/list/$placeId"));
      final body = jsonDecode(response.body);
      debugPrint(body.toString());

      return Place.fromJson(body);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<PreviewPlace>> getPlaceList() async {
    try {
      var response =
          await http.get(Uri.parse("https://youtube.anys34.com/list"));
      final body = jsonDecode(response.body);

      if (body.length == 0) return [];
      body.removeAt(0); // 빈 데이터가 들어감

      List<PreviewPlace> list =
          body.map<PreviewPlace>((i) => PreviewPlace.fromJson(i)).toList();
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

  Future<List<Comment>> getComment(int postId) async {
    try {
      var response = await http
          .get(Uri.parse("https://youtube.anys34.com/comment/$postId"));
      final body = jsonDecode(response.body);

      List<Comment> list =
          body.map<Comment>((i) => Comment.fromJson(i)).toList();
      return list;
    } catch (e) {
      throw e.toString();
    }
  }
}
