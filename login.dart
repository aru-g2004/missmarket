import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/pretty_bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/rm_bg_logo.png',
                width: 150,
                height: 150,
              ),
              Text("Create an Account",
                  style: GoogleFonts.nunitoSans(
                      color: Color.fromRGBO(9, 17, 62, 1.0),
                      decoration: TextDecoration.none,
                      fontSize: 30)),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
              SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
    );
  }
}