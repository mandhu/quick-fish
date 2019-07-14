import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';
import 'package:http/http.dart' as http;

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

  TextEditingController _searchController = TextEditingController();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<Listing> listings = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    loadItems();
    _searchController.addListener(() {
      loadItems(search: _searchController.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<List<Listing>> loadItems({search}) async {
    String _search = search == null ? '' : '?search=$search';
    final response =
        await http.get('https://freshub.blazing.mv/api/listings$_search');
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
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFEEEEEE),
                    blurRadius: 2.0,
                  )
                ],
              ),
              child: TextFormField(
                controller: _searchController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Text('Promoted', style: TextStyle(fontSize: 20),),
            ),
            Container(
              height: 140,
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
              child: Text('Latest', style: TextStyle(fontSize: 20)),
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
        bottomNavigationBar: NavigationBar(0));
  }

  Future<Null> _refresh() {
    loadItems();
    return new Future.delayed(Duration(seconds: 1), null);
  }
}
