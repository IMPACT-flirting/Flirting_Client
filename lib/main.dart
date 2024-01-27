import 'package:flirting/controller/auth_controller.dart';
import 'package:flirting/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var initialRoute = PageRouter.loginRoute;

    // ignore: unnecessary_null_comparison
    if (AuthController().getCurrentUser() != null) {
      initialRoute = PageRouter.homeRoute;
    }

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Pretendard",
      ),
      onGenerateRoute: PageRouter.generatedRoute,
      initialRoute: initialRoute,
    );
  }
}
