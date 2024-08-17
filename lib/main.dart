import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project/firebase_options.dart';
import 'package:project/routes/pages.dart';
import 'package:project/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Pages.pages,
      initialRoute: Routes.login,
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    );
  }
}
