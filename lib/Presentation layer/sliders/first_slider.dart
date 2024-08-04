import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class FirstSlider extends StatefulWidget {
  const FirstSlider({super.key});

  @override
  State<FirstSlider> createState() => _FirstSliderState();
}

class _FirstSliderState extends State<FirstSlider> {
  @override

  Widget build(BuildContext context) {
    return Container(
          child:ListView(
            shrinkWrap: true,
            children: [
              CarouselSlider(items: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("assets/img1.png"),
                        fit:BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage("assets/img1.png"),
                            fit: BoxFit.cover),

                    ),
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage("assets/img1.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                ),

        
              ],
                options: CarouselOptions(
                  height:150,
                  autoPlay:true,
                  enableInfiniteScroll:false,
                  autoPlayCurve:Curves.fastOutSlowIn,
                  autoPlayAnimationDuration:Duration(milliseconds: 500),
                  viewportFraction:0.9,
                ),
              ),
        
            ],
          ),
    );

  }
}
