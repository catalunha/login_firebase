import 'package:get/get.dart';
import 'package:login_firebase/app/data/provider/auth_provider.dart';
import 'package:login_firebase/app/data/repository/auth_repository.dart';
import 'package:login_firebase/app/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        repository: AuthRepository(
          provider: AuthProvider(),
        ),
      ),
    );
  }
}
