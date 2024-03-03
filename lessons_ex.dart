import 'package:flutter/material.dart';

class lessonsExample extends StatefulWidget {
  const lessonsExample({Key? key}) : super(key: key);

  @override
  _lessonsExampleState createState() => _lessonsExampleState();
}

class _lessonsExampleState extends State<lessonsExample> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/lesson.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: TransparentMaterialButton(
            child: Text(""),
            onPressed: () {
              Navigator.pushNamed(context, '/lessonsExample_ex');
            },
          )
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