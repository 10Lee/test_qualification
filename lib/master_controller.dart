import 'package:flutter/cupertino.dart';
import 'package:flutter_test1/pages/home/home_page.dart';
import 'package:flutter_test1/pages/profile/profile_page.dart';
import 'package:flutter_test1/pages/user/user_page.dart';
import 'package:get/get.dart';

class MasterController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [
    const Homepage(),
    const Userpage(),
    const Profilepage(),
  ];
}
