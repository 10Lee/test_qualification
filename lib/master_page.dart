import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/master_controller.dart';
import 'package:flutter_test1/widgets/header1.dart';
import 'package:get/get.dart';

class Masterpage extends StatelessWidget {
  const Masterpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MasterController controller = Get.find<MasterController>();

    return Obx(
      () => Scaffold(
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () => controller.currentIndex.value = 0,
                child: Header1(
                  text: "HOME",
                  color:
                      controller.currentIndex == 0 ? Colors.blue : Colors.white,
                ),
              ),
              const SizedBox(width: 48.0),
              TextButton(
                onPressed: () => controller.currentIndex.value = 1,
                child: Header1(
                  text: "USERS",
                  color:
                      controller.currentIndex == 1 ? Colors.blue : Colors.white,
                ),
              ),
              const SizedBox(width: 48.0),
              TextButton(
                onPressed: () => controller.currentIndex.value = 2,
                child: Header1(
                  text: "PROFILE",
                  color:
                      controller.currentIndex == 2 ? Colors.blue : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
