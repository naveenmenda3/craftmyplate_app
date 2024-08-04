import 'package:flutter/material.dart';

import '../carditem_services.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<CardItemServices> service = [
    CardItemServices(
      platterimg: 'assets/ser1.png',
      title: 'Delivery',
      logo: 'assets/serdelivery.png',
    ),
    CardItemServices(
      platterimg: 'assets/ser1.png',
      title: 'Value',
      logo: 'assets/serdelivery.png',
    ),
    CardItemServices(
      platterimg: 'assets/ser1.png',
      title: 'Luxury',
      logo: 'assets/serdelivery.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.15),
        height: 405,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: service.length,
          separatorBuilder: (context, _) => const SizedBox(
            width: 0,
          ),
          itemBuilder: (context, index) => BuildCard(service[index]),
        ));
  }

  Widget BuildCard(CardItemServices service) => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Stack(
      children: <Widget>[
        Container(
          width: 310,
          height: 350,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(-4, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Know More',
                style: TextStyle(
                  color: Color(0xFF6318AF),
                  fontSize: 14,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 16,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                '${service.platterimg}',
                width: 278,
                height: 120,
              )),
        ),
        Positioned(
          top: 183,
          left: 18,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star_purple500_rounded),
                    Text(
                      'High Quality Disposable Cutlery',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_purple500_rounded),
                    Text(
                      'Elegant Decorations & Table Settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_purple500_rounded),
                    Text(
                      'Served by Waitstaff',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_purple500_rounded),
                    Text(
                      'Best for Weddings, Corporate Events etc',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 148,
          left: 16,
          child: Container(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    '${service.logo}',
                    height: 28,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    service.title,
                    style: TextStyle(
                      color: Color(0xFF6318AF),
                      fontSize: 20,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ),
      ],
    ),
  );
}
