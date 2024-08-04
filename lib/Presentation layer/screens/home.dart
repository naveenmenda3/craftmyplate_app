import 'package:craft_my_plate/Presentation layer/default_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:craft_my_plate/Domain layer/provider/auth_provider.dart';
import 'package:image_picker/image_picker.dart';
import '../Widgets/createplatter.dart';
import '../sliders/first_slider.dart';
import '../sliders/cateringmenus.dart';
import '../sliders/services.dart';
import '../sliders/deliverybox.dart';
import '../Widgets/mealbox.dart';
import 'package:craft_my_plate/Presentation layer/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var size, width;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(
                          24,
                          10,
                          0,
                          0,
                        ),
                        child: Text(
                          'Hi, Naveen!',
                          style: TextStyle(
                            color: Color(0xFF6318AF),
                            fontSize: 25,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ), //user welcome text
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 390,
                        height: 41,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text(
                                    'Current location',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF7B7B7B),
                                      fontSize: 13,
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 18,
                                          child: Stack(children: const [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 21,
                                              color: Color(0xFF6318AF),
                                            ),
                                          ]),
                                        ),
                                        const SizedBox(width: 1),
                                        const Text(
                                          'Hyderabad',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontFamily: 'Lexend',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 162,
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 26,
                                    top: 0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 30,
                                        height: 24,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Icon(
                                              Icons.play_circle_outline,
                                              color: Color(0xFF6318AF),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 0,
                                    top: 25,
                                    child: Text(
                                      'How it works?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontFamily: 'Lexend',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ), //Current Loaction and works
                      ),

                      //FIRSTPLATE slider
                    ]),
                const FirstSlider(),
                const SizedBox(
                  height: 10,
                ),
                StickyHeader(
                    header: Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 8, 25, 21),
                      child: Container(
                          height: 45,
                          width: width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.334),
                                style: BorderStyle.solid),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x197A20D4),
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ), //

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'Search food or events ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF545454),
                                    fontSize: 14,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          )), //Search bar
                    ), //Searchbar
                    content: Column(
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 28,
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Start crafting',
                              style: TextStyle(
                                color: Color(0xFF6318AF),
                                fontSize: 22,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ), //Start Crafting
                        const SizedBox(
                          height: 10,
                        ),
                        const createplatter(),
                        //create your own

                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: mealbox(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 25),
                          child: const Text(
                            'Delivey Box',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: const deliveybox(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'Catering Menus',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'More',
                                    style: TextStyle(
                                      color: Color(0xFF6318AF),
                                      fontSize: 14,
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            )),
                        cateringmenus(),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 25),
                          child: const Text(
                            'Services',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Services(),

                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(
                            left: 28,
                          ),
                          child: const Text(
                            'How It Works ?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Image.asset('assets/howitworks.png'),

                        Container(
                          width: 376,
                          height: 132,
                          padding: const EdgeInsets.only(
                            top: 23.43,
                            left: 24,
                            right: 97,
                            bottom: 46.57,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 255,
                                child: Text(
                                  'Delicious food with professional service !',
                                  style: TextStyle(
                                    color: Color(0xFF242424),
                                    fontSize: 25,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
