import 'package:flutter/material.dart';

import 'fish-card.component.dart';
import 'package:timeago/timeago.dart' as timeago;

class BoostedItem extends StatelessWidget {
  final String name;
  final String seller;
  final String price;

  BoostedItem({this.name, this.seller, this.price});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));

    return FishCard(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            height: 100,
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
              Row(
                children: <Widget>[
                  Text(seller),
                  SizedBox(width:10,),
                  Icon(Icons.star, color: Colors.orange[300], size: 14,),
                  Text('(3.6)', style: TextStyle(fontSize: 12),),
                ],
              ),
              SizedBox(height:12,),
              Text(timeago.format(fifteenAgo), style: TextStyle(fontSize: 12, color: Colors.black26)),
            ],
          )
        ],
      ),
    );
  }
}
