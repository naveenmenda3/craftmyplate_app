import 'package:flutter/material.dart';

class Walkthrough3 extends StatefulWidget {
  const Walkthrough3({Key? key}) : super(key: key);

  @override
  State<Walkthrough3> createState() => _Walkthrough3State();
}

class _Walkthrough3State extends State<Walkthrough3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: <Widget>[
        Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: 350,
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 50,
                      child: Container(
                        width: 291.51,
                        height: 371.30,
                        child: Image.asset('assets/os2.png'),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Order More, Save More',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF030303),
                fontSize: 28,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 328,
            child: Text(
              'Experience culinary artistry like never before with our '
                  'innovative anad exquisite cuisine creations',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontSize: 18,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
