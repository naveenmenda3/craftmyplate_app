import 'package:flutter/material.dart';

class Walkthrough4 extends StatefulWidget {
  const Walkthrough4({Key? key}) : super(key: key);

  @override
  State<Walkthrough4> createState() => _Walkthrough4State();
}

class _Walkthrough4State extends State<Walkthrough4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: 330,
                child: Stack(
                  children: [
                    Positioned(
                      top: -10,
                      left: 50,
                      child: Container(
                        width: 291.51,
                        height: 371.30,
                        child: Image.asset('assets/os3.png'),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Personal Order Executive',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF030303),
                fontSize: 24,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 328,
            child: Text(
              'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontSize: 16,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
