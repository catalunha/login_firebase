import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/app/modules/login/login_controller.dart';
import 'package:login_firebase/app/routes/app_routes.dart';
import 'package:login_firebase/app/theme/app_images.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Hero(
                tag: 'Hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48,
                  child: Image.asset(AppImages.login),
                ),
              ),
              const SizedBox(height: 48),
              TextFormField(
                controller: _loginController.emailTextEditingController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Campo obrigatório';
                  } else if (!GetUtils.isEmail(value!)) {
                    return 'Informe um email válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _loginController.passwordTextEditingController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Campo obrigatório';
                  } else if (value!.length < 3) {
                    return 'Senha deve ter mais de 3 caracteres';
                  }
                  return null;
                },
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: ElevatedButton(
                  child: const Text('Acessar'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.dialog(
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        barrierDismissible: false,
                      );
                      _loginController.login();
                    }
                  },
                ),
              ),
              TextButton(
                child: const Text(
                  'Esqueceu a senha ?',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: const Text(
                  'Cadastrar-me.',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Get.toNamed(Routes.register);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
