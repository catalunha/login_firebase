import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/translation/app_translations.dart';

import 'app/routes/routes.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init('login_firebase');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Firebase',
      theme: appThemeDataLight,
      darkTheme: appThemeDataDark,
      themeMode: ThemeMode.system,
      getPages: RoutesPages.pageList,
      initialRoute: RoutesPaths.splash,
      locale: const Locale('pt', 'BR'),
      translationsKeys: AppTranslations.translations,
    );
  }
}
