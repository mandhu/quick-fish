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

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    loadItems();
  }

  List<Listing> listings = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<List<Listing>> loadItems({search}) async {
    final response =
    await http.get('https://freshub.blazing.mv/api/listings');
    if (response.statusCode == 200) {
      final List<Listing> loaditems = [];
      for (var item in json.decode(response.body)['data']) {
        print('fish');
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Notifications', style: TextStyle(fontSize: 20)),
        ),
            Expanded(
                child: RefreshIndicator(
                    displacement: 0,
                    key: _refreshIndicatorKey,
                    onRefresh: () {
                      _refresh();
                    },
                    child: listings.isNotEmpty
                        ? ListView(padding: EdgeInsets.all(0), children: [
                      for (var item in listings)
                        ListItemCard(
                          id: item.id,
                          name: item.product,
                          seller: item.seller,
                          tag: '${item.id.toString()}${item.product}',
                          price: item.price,
                          createdAt: item.createdAt,
                          image: item.image,
                        )
                    ])
                        : Center(
                      child: Text('Loading...'),
                    )))
          ],
        ),
        bottomNavigationBar: NavigationBar(2));
  }

  Future<Null> _refresh() {
    loadItems();
    return new Future.delayed(Duration(seconds: 1), null);
  }
}
