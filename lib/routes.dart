import 'package:flirting/pages/auth/login_page.dart';
import 'package:flirting/pages/auth/signup_input_page.dart';
import 'package:flirting/pages/home/home_page.dart';
import 'package:flirting/pages/auth/sign_up_page.dart';
import 'package:flirting/pages/post/mainPosting_page.dart';
import 'package:flirting/pages/timeline/timeline_page.dart';
import 'package:flirting/pages/write/write_page.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static const String homeRoute = "home";
  static const String loginRoute = "login";
  static const String joinRoute = "join";
  static const String joinHomeRoute = "join_home";
  static const String timelineRoute = "timeline";
  static const String writeRoute = "write";
  static const String postRoute = "post";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case joinRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case joinHomeRoute:
        return MaterialPageRoute(builder: (_) => const LoginMainPage());
      case timelineRoute:
        return MaterialPageRoute(builder: (_) => TimelinePage());
      case writeRoute:
        return MaterialPageRoute(builder: (_) => const WritePage());
      case postRoute:
        return MaterialPageRoute(
            builder: (_) => const MainPostingPage(), settings: settings);
    }

    return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
