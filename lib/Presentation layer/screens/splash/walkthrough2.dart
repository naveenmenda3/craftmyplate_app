import 'package:flutter/material.dart';

class Walkthrough2 extends StatefulWidget {
  const Walkthrough2({Key? key}) : super(key: key);

  @override
  State<Walkthrough2> createState() => _Walkthrough2State();
}

class _Walkthrough2State extends State<Walkthrough2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: 270,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 70,
                      child: Container(
                        width: 250.51,
                        height: 280.30,
                        child: Image.asset('assets/os1.png',fit: BoxFit.cover,),
                      ),
                    ),



                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Choose & Customize!',
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
              'Select a platter,choose and customize '
                  'menu items aand craft a personalized menu '
                  'for event',
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
