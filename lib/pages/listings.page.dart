import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';
import 'package:http/http.dart' as http;
//import 'package:firebase_messaging/firebase_messaging.dart';

import '../listing.dart';

class ListingsPage extends StatefulWidget {
  @override
  _ListingsPageState createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  PageController _pageController =
      PageController(viewportFraction: 0.75, initialPage: 0, keepPage: true);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

//  final FirebaseMessaging _fcm = FirebaseMessaging();
  List<Listing> listings = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
//    _saveDeviceToken();
//    _fcm.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        print("onMessage: $message");
//        showDialog(
//          context: context,
//          builder: (context) => AlertDialog(
//            content: ListTile(
//              title: Text(message['notification']['title']),
//              subtitle: Text(message['notification']['body']),
//            ),
//            actions: <Widget>[
//              FlatButton(
//                child: Text('Ok'),
//                onPressed: () => Navigator.of(context).pop(),
//              ),
//            ],
//          ),
//        );
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        print("onLaunch: $message");
//        // TODO optional
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("onResume: $message");
//        // TODO optional
//      },
//    );
    loadItems();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // loadItems() async {
  //   var res = await http.get('http://10.10.21.185:8000/api/listings');

  // }

  Future<List<Listing>> loadItems() async {
    final response = await http.get('http://10.10.21.185:8000/api/listings');
    if (response.statusCode == 200) {
      final List<Listing> loaditems = [];
      for (var item in json.decode(response.body)['data']) {
        loaditems.add(Listing.fromJson(item));
      }
      setState(() {
        listings = loaditems;
      });
      return loaditems;
    } else {
      throw Exception('Failed to load post');
    }
  }

//  _saveDeviceToken() async {
//    // Get the token for this device
//    String fcmToken = await _fcm.getToken();
//
//    // Save it
//    if (fcmToken != null) {
//     print(fcmToken);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            FishCard(
              child: Text(
                'Search...',
                style: TextStyle(fontSize: 20),
              ),
              margin: EdgeInsets.all(20),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Text('Promoted'),
            ),
            Container(
              height: 120,
              child: Container(
                width: double.infinity,
                child: PageView(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    BoostedItem(name: 'Rae mas', seller: 'Hilman'),
                    BoostedItem(name: 'Bodu boava', seller: 'Hilman'),
                    BoostedItem(name: 'Faru tholhi', seller: 'Hilman')
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Latest'),
            ),
            Expanded(
                child: RefreshIndicator(
                    displacement: 0,
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: listings.isNotEmpty
                        ? ListView(padding: EdgeInsets.all(0), children: [
                            for (var item in listings)
                              ListItemCard(
                                name: item.product,
                                seller: item.seller,
                                tag: '${item.id.toString()}${item.product}',
                                price: item.price,
                                createdAt: item.createdAt,
                              )
                          ])
                        : Text('test')))
          ],
        ),
        bottomNavigationBar: NavigationBar(0));
  }

  Future<Null> _refresh() {
    return null;
  }
}
