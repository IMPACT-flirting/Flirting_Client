import 'package:flirting/pages/auth/signup_input_page.dart';
import 'package:flirting/pages/home/home_page.dart';
import 'package:flirting/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static const String homeRoute = "home";
  static const String loginRoute = "login";
  static const String joinRoute = "join";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginMainPage());
      case joinRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
    }

    return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
