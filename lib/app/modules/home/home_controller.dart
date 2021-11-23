import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/data/model/user_model.dart';
import 'package:login_firebase/app/theme/app_theme.dart';

class HomeController extends GetxController {
  final UserModel userModel = Get.arguments;
  GetStorage box = GetStorage('login_firebase');

  final _isThemeDarkActive = true.obs;
  get isThemeDarkActive => _isThemeDarkActive.value;
  set isThemeDarkActive(value) => _isThemeDarkActive.value = value;

  // @override
  // void onInit() {
  //   if (box.hasData('isThemeDarkActive')) {
  //     var isThemeDarkActive = box.read<bool>("isThemeDarkActive")!;
  //     print(isThemeDarkActive);
  //     // Get.changeTheme(appThemeDataDark);
  //     // Get.changeTheme(isThemeDarkActive ? appThemeDataDark : appThemeDataLight);
  //   }
  //   super.onInit();
  // }
  @override
  void onReady() {
    if (box.hasData('isThemeDarkActive')) {
      isThemeDarkActive = box.read<bool>("isThemeDarkActive")!;
      Get.changeTheme(isThemeDarkActive ? appThemeDataDark : appThemeDataLight);
    }
    super.onReady();
  }

  void changeTheme() {
    isThemeDarkActive = !isThemeDarkActive;
    box.write("isThemeDarkActive", isThemeDarkActive);
    Get.changeTheme(isThemeDarkActive ? appThemeDataDark : appThemeDataLight);
  }
}
