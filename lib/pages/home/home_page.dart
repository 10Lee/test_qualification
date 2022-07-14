import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/global/dimension.dart';
import 'package:flutter_test1/models/user_model.dart';
import 'package:flutter_test1/pages/home/home_controller.dart';
import 'package:flutter_test1/widgets/header1.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final Data user = controller.users[index];
                  return InkWell(
                    onTap: () => controller.toggleHighlight(user),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Dimension.height20,
                        horizontal: Dimension.width20,
                      ),
                      height: Dimension.height120,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        border: user.isHighlighted == true
                            ? Border.all(
                                width: Dimension.width2, color: Colors.red)
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimension.radius15),
                              bottomLeft: Radius.circular(Dimension.radius15),
                            ),
                            child: Image.network(
                              '${user.avatar}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Dimension.height10,
                                      horizontal: Dimension.width10,
                                    ),
                                    child: Header1(
                                      text:
                                          '${user.firstName} ${user.lastName}',
                                    )),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimension.height10,
                                      horizontal: Dimension.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email : '),
                                      Text(
                                        "${user.email}",
                                        style: TextStyle(
                                          fontSize: Dimension.font15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
