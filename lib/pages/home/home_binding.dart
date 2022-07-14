import 'package:flutter_test1/pages/home/home_controller.dart';
import 'package:flutter_test1/services/repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => Repository());
  }
}
