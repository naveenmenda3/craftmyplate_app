import 'package:flutter/material.dart';

import '../carditemclass.dart';

class createplatter extends StatefulWidget {
  const createplatter({Key? key}) : super(key: key);

  @override
  State<createplatter> createState() => _createplatterState();
}

class _createplatterState extends State<createplatter> {
  List<CardItem> items = [
    CardItem(
      platterimg: 'assets/food1.png',
      title: 'Default platter',
    ),
    CardItem(
      platterimg: 'assets/cs1.png',
      title: 'Craft Your Own ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 130,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (context, _) => const SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => BuildCard(items[index]),
        ));
  }

  Widget BuildCard(CardItem item) => GestureDetector(
    onTap: () {},
    child: Container(
      width: 170,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Image.asset(item.platterimg)),
          SizedBox(
            height: 7,
          ),
          Text(
            item.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
