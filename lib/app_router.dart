import 'package:flutter_test1/pages/auth/auth_binding.dart';
import 'package:flutter_test1/pages/auth/login._page.dart';
import 'package:flutter_test1/pages/detail/detail_binding.dart';
import 'package:flutter_test1/pages/detail/detail_page.dart';
import 'package:flutter_test1/pages/home/home_binding.dart';
import 'package:flutter_test1/pages/home/home_page.dart';
import 'package:flutter_test1/pages/profile/profile_page.dart';
import 'package:flutter_test1/pages/splash/splash_binding.dart';
import 'package:flutter_test1/pages/splash/splash_screen.dart';
import 'package:flutter_test1/pages/user/user_page.dart';
import 'package:get/get.dart';

import 'master_binding.dart';
import 'master_page.dart';

class AppRouter {
  static String root = '/';
  static String home = '/home';
  static String login = '/login';
  static String splash = '/splash';
  static String user = '/user';
  static String profile = '/profile';
  static String detail = '/detail';

  List<GetPage> pages = [
    GetPage(
      name: root,
      page: () => Masterpage(),
      bindings: [
        MasterBinding(),
        HomeBinding(),
        DetailBinding(),
      ],
    ),
    GetPage(
      name: login,
      page: () => Loginpage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: home,
      page: () => Homepage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: user,
      page: () => Userpage(),
    ),
    GetPage(
      name: profile,
      page: () => Profilepage(),
    ),
    GetPage(
      name: detail,
      page: () => const Detailpage(),
      binding: DetailBinding(),
    ),
  ];
}
