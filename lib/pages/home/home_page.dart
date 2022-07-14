import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        title: Text("HOME"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => controller.isLoading.value
            ? Center(
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
                      margin: const EdgeInsets.all(20),
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(15.0),
                        border: user.isHighlighted == true
                            ? Border.all(width: 2, color: Colors.red)
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
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
                                    padding: const EdgeInsets.all(10.0),
                                    child: Header1(
                                      text:
                                          '${user.firstName} ${user.lastName}',
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Email: ${user.email}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
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
