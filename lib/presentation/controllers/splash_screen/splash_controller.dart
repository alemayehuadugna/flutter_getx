import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print("inside init");
    _navigateToLoginPage();
    super.onInit();
  }

  _navigateToLoginPage() async {
    await precacheImage(const AssetImage("assets/bellyboy.png"), Get.context!)
        .then((value) async {
          print("image loaded");
      return await Future.delayed(const Duration(milliseconds: 1000), () {});
    });

    Get.offNamed("/login");
  }
}
