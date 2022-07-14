import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/pages/home/home_controller.dart';
import 'package:flutter_test1/widgets/header1.dart';
import 'package:get/get.dart';

class Userpage extends StatelessWidget {
  const Userpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("USERS"),
        centerTitle: true,
      ),
      body: Obx(
        () => GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            crossAxisCount: 2,
            childAspectRatio: 0.57,
          ),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];

            return InkWell(
              onTap: () => Get.toNamed(
                '/detail',
                arguments: {
                  'id': user.id,
                },
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        '${user.avatar}',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 40.0,
                      child: Header1(
                        text: "${user.firstName} ${user.lastName}",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 50.0,
                      child: Text(
                        "Email : ${user.email}",
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
