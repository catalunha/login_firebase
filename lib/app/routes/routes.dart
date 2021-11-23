import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_firebase/app/modules/home/home.dart';
import 'package:login_firebase/app/modules/home/home_binding.dart';
import 'package:login_firebase/app/modules/login/login.dart';
import 'package:login_firebase/app/modules/login/login_binding.dart';
import 'package:login_firebase/app/modules/register/register.dart';
import 'package:login_firebase/app/modules/register/register_binding.dart';
import 'package:login_firebase/app/modules/splash/splash.dart';

abstract class RoutesPaths {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
}

class RoutesPages {
  static final pageList = [
    GetPage(
      name: RoutesPaths.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: RoutesPaths.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesPaths.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RoutesPaths.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
