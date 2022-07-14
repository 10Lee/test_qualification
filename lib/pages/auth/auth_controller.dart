import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool enableBtn = false.obs;

  void redirect() {
    isLoading.value = true;
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed('/');
      isLoading.value = false;
    });
  }

  // String validatePass(value) {
  //   RegExp regex =
  //       RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])$');
  //   if (!regex.hasMatch(value)) {
  //     return "Masukan password yang kuat";
  //   } else {
  //     return "";
  //   }
  // }
}
