import 'package:flutter/material.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isChecked = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, left: 20, bottom: 20),
              // color: Color(0xff3B85D2),
              child: Row(children: <Widget>[
                Text('My Orders',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black54))
              ]),
            ),
            Expanded(
                child: RefreshIndicator(
                    displacement: 0,
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: ListView(padding: EdgeInsets.all(0), children: [
                      ListItemCard(
                        name: 'Rae mas',
                        seller: 'Hilman',
                        tag: 'sadfd22sfsafs',
                      ),
                      ListItemCard(
                          name: 'Bodu boava',
                          seller: 'Hilman',
                          tag: 'sadfdsfs4a4fs'),
                      ListItemCard(
                          name: 'Faru tholhi',
                          seller: 'Hilman',
                          tag: 'sad2fdsfsafs'),
                      ListItemCard(
                          name: 'Rae mas',
                          seller: 'Hilman',
                          tag: 'sadfdsfs4afs'),
                      ListItemCard(
                          name: 'Bodu boava',
                          seller: 'Hilman',
                          tag: 'sadfd2sfsafs'),
                      ListItemCard(
                          name: 'Faru tholhi',
                          seller: 'Hilman',
                          tag: 'sadf3dsfsafs'),
                      ListItemCard(
                          name: 'Rae mas',
                          seller: 'Hilman',
                          tag: 'sadfdsfsrafs'),
                      ListItemCard(
                          name: 'Bodu boava',
                          seller: 'Hilman',
                          tag: 'sadfedsfsafs'),
                      ListItemCard(
                          name: 'Faru tholhi',
                          seller: 'Hilman',
                          tag: 'sadf3dsf34safs')
                    ])))
          ],
        ),
        bottomNavigationBar: NavigationBar(0));
  }

  Future<Null> _refresh() {
    return null;
  }
}
