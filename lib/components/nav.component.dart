import 'package:flutter/material.dart';

//class NavigatorComponent extends StatefulWidget {
//  @override
//  _NavigatorState createState() => _NavigatorState();
//}
//
//class _NavigatorState extends State<Navigator> {
////  TextStyle labelStyle = TextStyle(color: Colors.black45);
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Column(
//          children: <Widget>[
//            Icon(Icons.list),
//            Text('LISTING', style: TextStyle(color: Colors.black45))
//          ],
//        ),
//        Column(
//          children: <Widget>[
//            Icon(Icons.account_circle),
//            Text('PROFILE', style: TextStyle(color: Colors.black45))
//          ],
//        ),
//        Column(
//          children: <Widget>[
//            Text('MVR 100.00'),
//            Text(
//              'YOUR BALANCE',
//              style: TextStyle(color: Colors.black45),
//            )
//          ],
//        )
//      ],
//    );
//  }
//}

class NavigatorComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.list),
              Text('LISTING', style: TextStyle(color: Colors.black45))
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.account_circle),
              Text('PROFILE', style: TextStyle(color: Colors.black45))
            ],
          ),
          Column(
            children: <Widget>[
              Text('MVR 100.00'),
              Text(
                'YOUR BALANCE',
                style: TextStyle(color: Colors.black45),
              )
            ],
          )
        ],
      ),
    );
  }
}

