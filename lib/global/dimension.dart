import 'package:flutter_test1/global/variables.dart';
import 'package:get/get.dart';

class Dimension {
  // Screen height 781.1
  // Screen width 392.7
  // static double screenHeight = Get.context!.size!.height;
  // static double screenWidth = Get.context!.size!.width;

  static double screenHeight =
      getMediaQuery(Get.context!, MediaQueryTypes.height);
  static double screenWidth =
      getMediaQuery(Get.context!, MediaQueryTypes.width);

  // For SizedBox, Padding and Margin
  static double height5 = screenHeight / 156.2;
  static double height10 = screenHeight / 78.1;
  static double height12 = screenHeight / 65;
  static double height15 = screenHeight / 52;
  static double height20 = screenHeight / 39.5;
  static double height25 = screenHeight / 31.2;
  static double height30 = screenHeight / 26;
  static double height40 = screenHeight / 19.5;
  static double height50 = screenHeight / 15.62;
  static double height60 = screenHeight / 13;
  static double height70 = screenHeight / 11.1;
  static double height80 = screenHeight / 9.7;
  static double height100 = screenHeight / 7.81;
  static double height120 = screenHeight / 6.5;
  static double height150 = screenHeight / 5.2;
  static double height170 = screenHeight / 4.5;
  static double height200 = screenHeight / 3.9;
  static double height300 = screenHeight / 2.6;

  static double width2 = screenWidth / 196.3;
  static double width5 = screenWidth / 78.4;
  static double width10 = screenWidth / 39.3;
  static double width12 = screenWidth / 32.7;
  static double width15 = screenWidth / 26.2;
  static double width20 = screenWidth / 19.6;
  static double width30 = screenWidth / 13;
  static double width25 = screenWidth / 15.7;
  static double width40 = screenWidth / 9.8;
  static double width50 = screenWidth / 7.8;
  static double width60 = screenWidth / 6.5;
  static double width100 = screenWidth / 3.9;
  static double width150 = screenWidth / 2.6;
  static double width165 = screenWidth / 2.3;
  static double width170 = screenWidth / 2.3;
  static double width200 = screenWidth / 1.9;
  static double width230 = screenWidth / 1.7;
  static double width300 = screenWidth / 1.3;
  static double width400 = screenWidth / 0.9;

  // For Border Radius
  static double radius8 = screenHeight / 97.6;
  static double radius10 = screenHeight / 78.1;
  static double radius15 = screenHeight / 52;
  static double radius20 = screenHeight / 39;
  static double radius30 = screenHeight / 26;
  static double radius120 = screenHeight / 6.5;

  // For Icon Size
  static double iconSize45 = screenHeight / 17.3;

  // For Image
  static double imageHeight200 = screenHeight / 3.9;
  static double imageHeight300 = screenHeight / 2.6;

  static double imageWidth200 = screenWidth / 1.9;
  static double imageWidth300 = screenWidth / 1.3;

  // For Fonts
  static double font12 = screenHeight / 65;
  static double font15 = screenHeight / 52;
  static double font18 = screenHeight / 43.3;
  static double font20 = screenHeight / 39;
  static double font22 = screenHeight / 35.5;
  static double font24 = screenHeight / 32.5;
  static double font30 = screenHeight / 26;
  static double font40 = screenHeight / 19;
}
