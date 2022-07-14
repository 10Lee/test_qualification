import 'package:flutter_test1/pages/detail/detail_controller.dart';
import 'package:flutter_test1/services/repository.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
    Get.lazyPut(() => Repository());
  }
}
