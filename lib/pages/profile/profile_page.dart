import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_test1/global/dimension.dart';
import 'package:get/get.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: Dimension.height40),
          Center(
            child: CircleAvatar(
              radius: Dimension.radius120,
              backgroundImage: AssetImage(
                'assets/images/profile_doggy.jpg',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.width40,
              vertical: Dimension.height20,
            ),
            height: Dimension.height200,
            child: Text(
              "${lorem(paragraphs: 1, words: 40)}",
              style: TextStyle(fontSize: Dimension.font15),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.offAllNamed('/splash'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.width40,
                vertical: Dimension.height15,
              ),
            ),
            child: Text(
              "SIGN OUT",
              style: TextStyle(fontSize: Dimension.font30),
            ),
          ),
          SizedBox(
            height: Dimension.height40,
          ),
        ],
      ),
    );
  }
}
