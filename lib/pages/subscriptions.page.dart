import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';
import 'package:http/http.dart' as http;
//import 'package:firebase_messaging/firebase_messaging.dart';

import '../listing.dart';
import 'package:timeago/timeago.dart' as timeago;

class SubscriptionsPage extends StatefulWidget {
  @override
  _SubscriptionsPageState createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  PageController _pageController =
      PageController(viewportFraction: 0.75, initialPage: 0, keepPage: true);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<int> listings = [1,2,3,4,5,6,7];

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

//  Future<List<Listing>> loadItems() async {
//    final response = await http.get('https://freshub.blazing.mv/api/listings');
//    if (response.statusCode == 200) {
//      final List<Listing> loaditems = [];
//      for (var item in json.decode(response.body)['data']) {
//        loaditems.add(Listing.fromJson(item));
//      }
//      setState(() {
//        listings = loaditems;
//      });
//      return loaditems;
//    } else {
//      throw Exception('Failed to load post');
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().add(Duration( minutes: 17));
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Notifications'),
              ),
              Expanded(
                  child: ListView(padding: EdgeInsets.all(0), children: [
                    for (var item in listings)
                      FishCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Item available', style: TextStyle(fontSize: 18, color: Colors.black54)),
                                Text('Ahmed', style: TextStyle(color: Colors.black38)),
                                SizedBox(height: 20,)
                              ],
                            ),
                            Text(timeago.format(fifteenAgo), style: TextStyle(color: Colors.black26)),
                          ],
                        )
                      )
                  ]))
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(2));
  }

  Future<Null> _refresh() {
    return null;
  }
}
