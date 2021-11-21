import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/app/data/model/user_model.dart';
import 'package:login_firebase/app/data/repository/auth_repository.dart';
import 'package:login_firebase/app/routes/app_routes.dart';

class LoginController extends GetxController {
  // final LoginRepository repository = LoginRepository();
  final AuthRepository repository;
  LoginController({required this.repository});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  void login() async {
    UserModel? userModel = await repository.signInWithEmailAndPassword(
      emailTextEditingController.text,
      passwordTextEditingController.text,
    );
    if (userModel != null) {
      onUserIsLogged(userModel);
    }
  }

  void onUserIsLogged(UserModel userModel) {
    Get.offAllNamed(
      Routes.home,
      arguments: userModel,
    );
  }
}
