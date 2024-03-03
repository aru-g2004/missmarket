import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'login.dart';
import 'signup.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    initialRoute: '/loading',
    routes: {
      '/loading' : (context) => loading(),
      '/home' : (context) => home(),
      '/login' : (context) => login(),
      '/signup' : (context) => signup(),




    },
  ));
}