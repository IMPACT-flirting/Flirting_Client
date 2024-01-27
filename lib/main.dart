import 'package:flirting/controller/auth_controller.dart';
import 'package:flirting/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  createState() => _AppState();
}

class _AppState extends State<MyApp> {
  var initialRoute = PageRouter.joinHomeRoute;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      if (await AuthController().getCurrentUser() != null) {
        initialRoute = PageRouter.homeRoute;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
