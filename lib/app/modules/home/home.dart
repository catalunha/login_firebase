import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/app/modules/home/home_controller.dart';
import 'package:login_firebase/app/modules/login/login_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();
  final LoginController _loginController = Get.find<LoginController>();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              image: DecorationImage(
                image: NetworkImage(_homeController.userModel.photoURL ??
                    'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(75.0)),
              boxShadow: const [
                BoxShadow(blurRadius: 7.0, color: Colors.black)
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Text(
            '${_homeController.userModel.displayName}',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            '${_homeController.userModel.email}',
            style: const TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Idioma: pt_BR");
                },
                child: const Center(
                  child: Text(
                    'pt_BR',
                    style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 25.0),
              ElevatedButton(
                onPressed: () {
                  print("Idioma: en_US");
                },
                child: const Center(
                  child: Text(
                    'en_US',
                    style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          Obx(() => Text('ThemeDark: ${_homeController.isThemeDarkActive}')),
          GetX<HomeController>(
            // init: HomeController(),
            // initState: (_) {},
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _homeController.isThemeDarkActive
                      ? ElevatedButton(
                          onPressed: () {
                            _homeController.changeTheme();
                          },
                          child: const Center(
                            child: Text(
                              'Tema: Claro',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            _homeController.changeTheme();
                          },
                          child: const Center(
                            child: Text(
                              'Tema: Escuro',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        )
                ],
              );
            },
          ),
          const SizedBox(height: 25.0),
          ElevatedButton(
            onPressed: () {
              _loginController.logout();
            },
            child: const Center(
              child: Text(
                'Sair',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
