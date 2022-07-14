import 'package:flutter/material.dart';
import 'package:flutter_test1/pages/auth/auth_binding.dart';
import 'package:flutter_test1/pages/auth/login._page.dart';
import 'package:flutter_test1/master_binding.dart';
import 'package:flutter_test1/master_page.dart';
import 'package:flutter_test1/pages/detail/detail_binding.dart';
import 'package:flutter_test1/pages/detail/detail_page.dart';
import 'package:flutter_test1/pages/profile/profile_page.dart';
import 'package:flutter_test1/pages/splash/splash_binding.dart';
import 'package:flutter_test1/pages/splash/splash_screen.dart';
import 'package:flutter_test1/pages/user/user_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/home/home_binding.dart';
import 'pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => Masterpage(),
          bindings: [
            MasterBinding(),
            HomeBinding(),
            DetailBinding(),
          ],
        ),
        GetPage(
          name: '/login',
          page: () => Loginpage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => Homepage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/user',
          page: () => Userpage(),
        ),
        GetPage(
          name: '/profile',
          page: () => Profilepage(),
        ),
        GetPage(
          name: '/detail',
          page: () => const Detailpage(),
          binding: DetailBinding(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
