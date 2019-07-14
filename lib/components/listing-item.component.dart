import 'package:flutter/material.dart';
import 'package:quick_fish/pages/details.page.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'fish-card.component.dart';

class ListItemCard extends StatelessWidget {
  final String name;
  final String seller;
  final String price;
  final String tag;

  ListItemCard({this.name, this.seller, this.price, this.tag});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));

    return Container(
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ProductDetailsPage(tag);
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
                            'http://placekitten.com/150/150',
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
