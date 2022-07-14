import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  void redirect() {
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed('/login');
    });
  }

  @override
  void onReady() {
    super.onReady();
    redirect();
  }
}
