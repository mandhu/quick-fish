import 'package:flutter/material.dart';

//class ListingsPage extends StatefulWidget {
//  @override
//  _ListingsPageState createState() => _ListingsPageState();
//}
//
//class _ListingsPageState extends State<ListingsPage>
//    with SingleTickerProviderStateMixin {
//  AnimationController _controller;
//
//  @override
//  void initState() {
//    _controller = AnimationController(vsync: this);
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 700,
//      child: Column(
//        children: <Widget>[
//          Expanded(child: Text('hskjdhfksjdhf')),
//          Text('jhsdkfhsdkfhdskj')
//        ],
//      ),
//    );
//  }
//}


class ListingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(child: Text('hskjdhfksjdhf')),
          Text('jhsdkfhsdkfhdskj')
        ],
      ),
    );
  }
}

