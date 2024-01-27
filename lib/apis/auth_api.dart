import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flirting/utils/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthApi {
  Future<CustomResponse> signIn(String id, String password) async {
    try {
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      var body = json.encode({
        'userId': id,
        'password': password,
      });

      var response = await dio.post(
        "https://youtube.anys34.com/login",
        options: Options(contentType: Headers.jsonContentType),
        data: body,
      );

      const storage = FlutterSecureStorage();
      await storage.write(key: "userId", value: response.data.toString());

      if (response.statusCode != 200) {
        return CustomResponse(isSuccess: false, message: "로그인 실패");
      }

      return CustomResponse(isSuccess: true, message: "로그인 성공");
    } catch (e) {
      debugPrint(e.toString());
      return CustomResponse(isSuccess: false, message: e.toString());
    }
  }

  Future<CustomResponse> signUp(
      String id, String password, String confirmPassword) async {
    try {
      // 비밀번호 확인
      if (password.compareTo(confirmPassword) != 0) {
        return CustomResponse(isSuccess: false, message: "비밀번호가 일치하지 않습니다");
      }

      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 5), //5s
        receiveTimeout: const Duration(seconds: 3), //15s
      );
      Dio dio = Dio(options);

      var body = json.encode({
        'userId': id,
        'password': password,
      });

      var response = await dio.post(
        "https://youtube.anys34.com/signin",
        options: Options(contentType: Headers.jsonContentType),
        data: body,
      );

      if (response.statusCode != 200) {
        return CustomResponse(isSuccess: false, message: "회원가입 실패");
      }

      return CustomResponse(isSuccess: true, message: "회원가입 성공");
    } catch (e) {
      debugPrint(e.toString());
      return CustomResponse(isSuccess: false, message: e.toString());
    }
  }

  void logout() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: "userId");
  }
}
