import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_firebase/app/modules/home/home.dart';
import 'package:login_firebase/app/modules/login/login.dart';
import 'package:login_firebase/app/modules/login/login_binding.dart';
import 'package:login_firebase/app/modules/register/register.dart';
import 'package:login_firebase/app/modules/register/register_binding.dart';
import 'package:login_firebase/app/modules/splash/splash.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
  ];
}
