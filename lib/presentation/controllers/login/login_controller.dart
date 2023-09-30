import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  RxBool shouldIChangeColor = false.obs;
  RxString buttonText = "Enter your e-mail address".obs;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    super.onInit();
  }

  void checkEmail(String text) async {
    bool isEmailCorrect =
        RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
            .hasMatch(text);
    if (!isEmailCorrect) {
      buttonText.value = "Enter your e-mail address";
      shouldIChangeColor.value = false;
    } else if (isEmailCorrect) {
      buttonText.value = "Next";
      shouldIChangeColor.value = true;
    }
  }
}
