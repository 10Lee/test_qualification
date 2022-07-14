import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/global/dimension.dart';
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
      body: Obx(
        () => controller.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: Dimension.height40),
                  Center(
                    child: CircleAvatar(
                      radius: Dimension.radius120,
                      backgroundImage: NetworkImage(
                        '${controller.userDetail.value.avatar}',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimension.width40,
                        vertical: Dimension.height20),
                    height: Dimension.height70,
                    child: Text(
                      "${controller.userDetail.value.firstName} ${controller.userDetail.value.lastName}",
                      style: TextStyle(
                        fontSize: Dimension.font20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width40,
                      vertical: Dimension.height20,
                    ),
                    height: Dimension.height70,
                    child: Text(
                      "Email : ${controller.userDetail.value.email}",
                      style: TextStyle(
                        fontSize: Dimension.font15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller
                        .toggleHighlight(controller.userDetail.value.id!),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimension.width40,
                        vertical: Dimension.width15,
                      ),
                    ),
                    child: Text(
                      "TOGGLE HIGHLIGHT",
                      style: TextStyle(fontSize: Dimension.font20),
                    ),
                  ),
                  SizedBox(height: Dimension.height40),
                ],
              ),
      ),
    );
  }
}
