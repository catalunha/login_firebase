import 'package:get/get.dart';
import 'package:login_firebase/app/data/provider/auth_provider.dart';
import 'package:login_firebase/app/data/repository/auth_repository.dart';
import 'package:login_firebase/app/modules/home/home_controller.dart';
import 'package:login_firebase/app/modules/login/login_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<LoginController>(
    //   () => LoginController(
    //     repository: AuthRepository(
    //       provider: AuthProvider(),
    //     ),
    //   ),
    // );
  }
}
