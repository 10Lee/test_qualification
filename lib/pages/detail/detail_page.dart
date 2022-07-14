import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/pages/detail/detail_controller.dart';
import 'package:get/get.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.find<DetailController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: GetBuilder<DetailController>(
        init: DetailController(),
        builder: (_) => controller.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 40.0),
                  Center(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(
                        '${controller.detailAvatar}',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    height: 70,
                    child: Text(
                      "${controller.detailFirstName} ${controller.detailLastName}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    height: 70.0,
                    child: Text(
                      "Email : ${controller.detailEmail.value}",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller
                        .toggleHighlight(controller.detailIsHighlight.value),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                    ),
                    child: Text(
                      "TOGGLE HIGHLIGHT",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
      ),
    );
  }
}
