import 'package:flutter/material.dart';

import 'fish-card.component.dart';

class BoostedItem extends StatelessWidget {
  final String name;
  final String seller;
  final String price;

  BoostedItem({this.name, this.seller, this.price});

  @override
  Widget build(BuildContext context) {
    return FishCard(
      margin: EdgeInsets.only(top: 10,bottom: 10, right: 5),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 80,
            height: 80,
            child: Placeholder(
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(name, style: TextStyle(fontSize: 20)),
              Text(seller),
            ],
          )
        ],
      ),
    );
  }
}
