import 'package:get/get.dart';
import 'package:login_firebase/app/data/provider/auth_provider.dart';
import 'package:login_firebase/app/data/repository/auth_repository.dart';
import 'package:login_firebase/app/modules/login/login_controller.dart';
import 'package:login_firebase/app/modules/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        repository: AuthRepository(
          provider: AuthProvider(),
        ),
      ),
    );
  }
}
