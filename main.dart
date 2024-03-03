import 'package:flutter/material.dart';
import 'package:innovate_her/trading.dart';
import 'home.dart';
import 'investments.dart';
import 'lessons.dart';
import 'lessons_ex.dart';
import 'loading.dart';
import 'login.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    initialRoute: '/loading',
    debugShowCheckedModeBanner: false,
    routes: {
      '/loading' : (context) => loading(),
      '/home' : (context) => VideoPlayerScreen(),
      '/login' : (context) => login(),
      '/trading' : (context) => DTOSearch(),
      '/lessons' : (context) => lessons(),
      '/lessons_ex' : (context) => lessonsExample(),
      '/invest' : (context) => invest(),
    },
  ));
}
