import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/data/model/user_model.dart';
import 'package:login_firebase/app/data/repository/auth_repository.dart';
import 'package:login_firebase/app/routes/routes.dart';
import 'package:login_firebase/app/theme/app_theme.dart';

class LoginController extends GetxController {
  // final LoginRepository repository = LoginRepository();
  final AuthRepository repository;
  LoginController({required this.repository});

  final TextEditingController emailTextEditingController =
      TextEditingController(text: 'a@a.com');
  final TextEditingController passwordTextEditingController =
      TextEditingController(text: '123456');

  GetStorage box = GetStorage('login_firebase');

  @override
  void onReady() {
    isLogged();
    super.onReady();
  }

  void isLogged() {
    if (box.hasData('auth')) {
      UserModel userModel = UserModel.fromJson(box.read('auth'));
      onUserIsLogged(userModel);
    }
  }

  void login() async {
    UserModel? userModel = await repository.signInWithEmailAndPassword(
      emailTextEditingController.text,
      passwordTextEditingController.text,
    );
    if (userModel != null) {
      box.write('auth', userModel.toJson());

      onUserIsLogged(userModel);
    }
  }

  void onUserIsLogged(UserModel userModel) {
    Get.offAllNamed(
      RoutesPaths.home,
      arguments: userModel,
    );
  }

  void logout() {
    repository.signOut();
    Get.offAllNamed(
      RoutesPaths.login,
    );
  }
}
