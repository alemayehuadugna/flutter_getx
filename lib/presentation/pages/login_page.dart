// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_getx/presentation/controllers/login/login_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

double permanentHeight = 0;

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    if (keyboardHeight != 0) {
      permanentHeight = keyboardHeight;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                SizedBox(
                  height: keyboardHeight != 0
                      ? MediaQuery.of(context).size.height -
                          205 -
                          keyboardHeight
                      : MediaQuery.of(context).size.height -
                          205 -
                          permanentHeight,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Log in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.emailController,
                          cursorColor: Colors.yellow,
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 13),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            fillColor: Color(0x00ffffff),
                            alignLabelWithHint: true,
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(218, 217, 217, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Times New Roman',
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            filled: false,
                          ),
                          onChanged: (text) async {
                            controller.checkEmail(text);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Find e-mail"),
                      SizedBox(width: 8),
                      VerticalDivider(
                        indent: 1,
                        color: Color.fromRGBO(218, 217, 217, 1),
                        endIndent: 1,
                        thickness: 1,
                      ),
                      SizedBox(width: 8),
                      CustomText(text: "Find password"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: controller.shouldIChangeColor.value
                        ? Colors.black
                        : const Color.fromRGBO(218, 217, 217, 1),
                  ),
                  onPressed: () => {},
                  child: Ink(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text(
                          controller.buttonText.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Times New Roman',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        color: Color.fromRGBO(218, 217, 217, 1),
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Times New Roman',
      ),
    );
  }
}
