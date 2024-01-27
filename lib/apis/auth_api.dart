// import 'package:flutter_web_auth/flutter_web_auth.dart';

// class AuthApi {
//   Future<void> signIn() async {
//     const APP_DIRECT_URL = ""; // redirect URL

//     final url = Uri.parse("backendURL$APP_DIRECT_URL");
//     final result = await FlutterWebAuth.authenticate(
//         url: url.toString(), callbackUrlScheme: APP_DIRECT_URL);

//     final accessToken = Uri.parse(result).queryParameters['access-token'];
//     final refreshToken = Uri.parse(result).queryParameters['refresh-token'];
//   }
// }
