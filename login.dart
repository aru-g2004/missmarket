
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miss_market/signup.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'GoogleSignInProvider.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);
          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return home();
          } else {
            return signup();
          }
        },
      ),
    ),
  );

  Widget buildLoading() => Container(
    color: Color.fromRGBO(244, 135, 227, 1),
    child: Center(child: const CircularProgressIndicator()),
  );
}