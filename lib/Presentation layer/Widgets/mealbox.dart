import 'package:flutter/material.dart';
import 'package:craft_my_plate/Presentation layer/mealcard.dart';

class mealbox extends StatefulWidget {
  const mealbox({super.key});

  @override
  State<mealbox> createState() => _mealboxState();
}

class _mealboxState extends State<mealbox> {
  List<mealCardItem> items = [
    mealCardItem(
      platterimg: 'assets/3cp1.png',
      title: '3cp',
    ),
    mealCardItem(
      platterimg: 'assets/5cp1.png', title: '5cp',
    ),
    mealCardItem(platterimg: 'assets/8cp1.png',title: '8cp'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:5,left: 25,),
              child: Text("Meal Box",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),),
            ),
            SizedBox(width: 200,),
            Text("More",
              style: TextStyle(fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),),
          ],
        ),
        Padding(
         padding: EdgeInsets.only(left: 25),
          child: Text("Best for small gatherings and house-parties",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),),
        ),
        Container(
            padding: const EdgeInsets.only(top:4,left: 20, right: 20),
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, _) => const SizedBox(

                width: 5,
              ),
              itemBuilder: (context, index) => BuildCard(items[index]),
            )),
      ],
    );
  }

  Widget BuildCard(mealCardItem item) => GestureDetector(
    onTap: () {},
    child: Container(
      width: 113,
      height: 100,
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
