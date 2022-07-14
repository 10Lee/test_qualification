import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test1/global/dimension.dart';
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
          padding: EdgeInsets.symmetric(
            vertical: Dimension.height20,
            horizontal: Dimension.width20,
          ),
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
                  borderRadius: BorderRadius.circular(Dimension.radius15),
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
                        topLeft: Radius.circular(Dimension.radius15),
                        topRight: Radius.circular(Dimension.radius15),
                      ),
                      child: Image.network(
                        '${user.avatar}',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: Dimension.height20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimension.height10,
                        horizontal: Dimension.width10,
                      ),
                      height: Dimension.height40,
                      child: Header1(
                        text: "${user.firstName} ${user.lastName}",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimension.height10,
                        horizontal: Dimension.width10,
                      ),
                      height: Dimension.height50,
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
