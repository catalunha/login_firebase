import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/data/model/user_model.dart';
import 'package:login_firebase/app/data/repository/auth_repository.dart';
import 'package:login_firebase/app/routes/routes.dart';

class RegisterController extends GetxController {
  // final LoginRepository repository = LoginRepository();
  final AuthRepository repository;
  RegisterController({required this.repository});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController nameTextEditingController =
      TextEditingController();
  GetStorage box = GetStorage('login_firebase');

  void register() async {
    UserModel? userModel = await repository.createUserModelWithEmailAndPassword(
        emailTextEditingController.text,
        passwordTextEditingController.text,
        nameTextEditingController.text);
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
}
