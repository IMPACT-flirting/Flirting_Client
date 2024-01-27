import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthAnimation extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animationHeight;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    final curve =
        CurvedAnimation(parent: animationController!, curve: Curves.decelerate);

    animationHeight = Tween<double>(begin: 0, end: 300).animate(curve)
    animationController!.forward();
  }
}
