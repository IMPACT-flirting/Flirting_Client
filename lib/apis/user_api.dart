import 'package:dio/dio.dart';

class UserApi {
  Future<String> getProfile(String userId) async {
    var options = BaseOptions(
      connectTimeout: const Duration(seconds: 5), //5s
      receiveTimeout: const Duration(seconds: 3), //15s
    );
    Dio dio = Dio(options);

    var response = await dio.get("https://youtube.anys34.com/profile/$userId");
    return response.data.toString();
  }
}
