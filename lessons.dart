import 'package:flutter/material.dart';

class lessons extends StatefulWidget {
  const lessons({Key? key}) : super(key: key);

  @override
  _lessonsState createState() => _lessonsState();
}

class _lessonsState extends State<lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(9, 17, 62, 1.0),),
          onPressed: () => Navigator.of(context).pop(),
        ),        actions: [
        IconButton(
          icon: Icon(Icons.arrow_forward, color: Color.fromRGBO(9, 17, 62, 1.0),),
          onPressed: () {
            Navigator.pushNamed(context, '/lessons_ex');
          },
        ),
      ],

        backgroundColor:  Color.fromRGBO(245,181,255, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
          image: AssetImage('assets/images/lessons.jpeg'),
      fit: BoxFit.cover,
      ),
      ),
      child: TransparentMaterialButton(
        child: Text(""),
      onPressed: () {
        Navigator.pushNamed(context, '/lessons_ex');
      },
      )),
    );
  }
}



class TransparentMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const TransparentMaterialButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Make material color transparent
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.transparent, // Make ink color transparent
          ),
          child: child,
        ),
      ),
    );
  }
}