import 'package:flutter/material.dart';
import 'package:craft_my_plate/Presentation layer/deliveryboxclass.dart';
class deliveybox extends StatefulWidget {
  const deliveybox({super.key});

  @override
  State<deliveybox> createState() => _deliveyboxState();
}

class _deliveyboxState extends State<deliveybox> {
  List<deliveryCard> items =[
    deliveryCard(
      platterimg : 'assets/db1.png',
      title: "",
    ),
    deliveryCard(platterimg: 'assets/db1.png',
        title: "",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (context, _) => const SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => BuildCard(items[index]),
        ));
  }

  Widget BuildCard(deliveryCard item) => GestureDetector(
    onTap: () {},
    child: Container(
      width: 250,
      height: 200,
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

