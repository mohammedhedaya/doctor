import 'package:doctor_chat/auth/LoginAndSignup/screen/login.dart';
import 'package:doctor_chat/core/cache_helper.dart';
import 'package:doctor_chat/core/services.dart';
import 'package:doctor_chat/firebase_options.dart';
import 'package:doctor_chat/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  await CacheHelper().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = CacheHelper().isLoggedIn();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? LoginScreen() // الصفحة الرئيسية عند تسجيل الدخول
          : HomePage(), // شاشة تسجيل الدخول عند عدم تسجيل الدخول
    );
  }
}
