import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:pazy_android/Model/local_authentication.dart';
import 'package:pazy_android/View/main_screen.dart';
import 'package:pazy_android/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalAuth.authenticate();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: MainScreen(),
        ),
      ),
    );
  }
}
