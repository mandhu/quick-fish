import 'package:flutter/material.dart';
import 'package:quick_fish/pages/details.page.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'fish-card.component.dart';

class ListItemCard extends StatelessWidget {
  final int id;
  final String name;
  final String seller;
  final String price;
  final String image;
  final String tag;
  final String createdAt;

  ListItemCard({this.id, this.name, this.seller, this.price, this.tag, this.createdAt, this.image});

  @override
  Widget build(BuildContext context) {
    // print(image);
    final fifteenAgo = DateTime.parse(createdAt);

    return Container(
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              print(id);
              return ProductDetailsPage(tag, id);
            }));
          },
          child: Container(
            child: FishCard(
              margin: EdgeInsets.only(bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.only(bottom: 8),
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Hero(
                          tag: tag,
                          child: Image.network(
                            'https://freshub.blazing.mv/storage$image',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(name, style: TextStyle(fontSize: 20, color: Colors.black54)),
                        Text(seller, style: TextStyle(color: Colors.black38)),
                        SizedBox(height: 20,),
                        Text(timeago.format(fifteenAgo), style: TextStyle(color: Colors.black26)),
                      ],
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: TextStyle(fontSize: 18, letterSpacing: -1.5, color: Colors.black45),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
