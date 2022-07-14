import 'package:flutter_test1/master_controller.dart';
import 'package:get/get.dart';

class MasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MasterController());
  }
}
