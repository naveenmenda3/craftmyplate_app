
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../menu.dart';
import 'package:craft_my_plate/Domain layer/provider/auth_provider.dart';
import 'package:craft_my_plate/Presentation layer/screens/login/login_screen.dart';
import 'package:craft_my_plate/Presentation layer/screens/splash/walkthrough2.dart';
import 'package:craft_my_plate/Presentation layer/screens/splash/walkthrough3.dart';
import 'package:craft_my_plate/Presentation layer/screens/splash/walkthrough4.dart';


class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 200),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0, top: 0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.purple.shade50),
                      // padding: EdgeInsets.all(3),
                      backgroundColor: Color(0xFFE0D4EC),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE0D4EC),
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFF6318AF),
                          fontSize: 18,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 500,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                    print(currentIndex);
                  });
                },
                children: [
                  Walkthrough2(),
                  Walkthrough3(),
                  Walkthrough4(),
                ],
              ),
            ),
            SizedBox(height: 34),
            SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.deepPurple,
                  dotColor: Colors.grey.shade400,
                  dotHeight: 10,
                  dotWidth: 13,
                )),
            SizedBox(
              height: 35,
            ),
            OutlinedButton(
              onPressed: () {
                if (currentIndex == 2) {
                  ap.isSignedIn == true
                      ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Menu()))
                      : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                } else {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 50),
                      curve: Curves.linear);
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.purple.shade50,
                ),
                shape: CircleBorder(),
                padding: EdgeInsets.all(13),
                backgroundColor: Color(0xFFE0D4EC),
              ),
              child: Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
