import 'package:flirting/controller/auth_controller.dart';
import 'package:flirting/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var initialRoute = PageRouter.loginRoute;

    if (AuthController().getCurrentUser() != null) {
      initialRoute = PageRouter.homeRoute;
    }

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: PageRouter.generatedRoute,
      initialRoute: initialRoute,
    );
  }
}
