import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  void redirect() {
    isLoading.value = true;
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed('/');
      isLoading.value = false;
    });
  }
}
