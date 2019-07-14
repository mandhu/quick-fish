import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';
import 'package:http/http.dart' as http;

import '../listing.dart';
import 'package:timeago/timeago.dart' as timeago;

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
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
          child: Text('Your wallet', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(40.0),
          child: Center(child: Text('\$ 300.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {},
              child: Text('Top-up', style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {},
              child: Text('Withdraw', style: TextStyle(color: Colors.white, fontSize: 18),),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Transactions', style: TextStyle(fontSize: 20)),
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
                        FishCard(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Top-up'),
                              Text('200.00', style: TextStyle(color: Colors.green),),
                            ],
                          ),
                        ),
                        FishCard(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Top-up'),
                              Text('200.00', style: TextStyle(color: Colors.green),),
                            ],
                          ),
                        ),
                        FishCard(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Purchase from Hilman'),
                              Text('-200.00', style: TextStyle(color: Colors.red),),
                            ],
                          ),
                        ),
                    ])
                        : Center(
                      child: Text('Loading...'),
                    )))
          ],
        ),
        bottomNavigationBar: NavigationBar(3));
  }

  Future<Null> _refresh() {
    loadItems();
    return new Future.delayed(Duration(seconds: 1), null);
  }
}
