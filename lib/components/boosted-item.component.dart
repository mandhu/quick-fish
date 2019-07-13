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
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: Image.network(
                  'http://placekitten.com/150/150',
                  fit: BoxFit.cover,
                )),
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
