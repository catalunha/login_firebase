import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key) {
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SplashPage')),
      body: Center(
        child: Column(
          children: const [
            Text('SplashPage'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  startTimeout() async {
    return Timer(const Duration(seconds: 2), exitSplashPage);
  }

  void exitSplashPage() async {
    Get.offNamed("/login");
  }
}


// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('SplashPage')),
//       body: const Text('SplashPage'),
//     );
//   }
// }
