import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  List<String> comments = [
    "Ready to trade!",
    "Empower yourself today with MissMarket!",
    "Money Money Money :)",
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushNamed(context, '/login');
    });

    return Container(
       color: Color.fromRGBO(159,107,225, 1),
      child: Column(children: [
        SizedBox(
          height: 200,
        ),
        Image.asset(
          'assets/images/logo.jpeg',
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Miss Markets",
              style: GoogleFonts.nunitoSans(
                  color: Color.fromRGBO(9, 17, 62, 1.0),
                  decoration: TextDecoration.none,
                  fontSize: 40)),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 150,
          width: 300,
          child: CarouselSlider(
            items: comments
                .map((item) => Text(item,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                    color: Color.fromRGBO(9,17,62, 1),
                    decoration: TextDecoration.none,
                    fontSize: 20)))
                .toList(),
            options: CarouselOptions(
                autoPlay: true, autoPlayInterval: Duration(seconds: 3)),
          ),
        ),
      ]),
    );
  }
}