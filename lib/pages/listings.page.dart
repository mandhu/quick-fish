import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FishCard(child: Text('Search...', style: TextStyle(fontSize: 20),), margin: EdgeInsets.all(20),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                key: _refreshIndicatorKey,
                onRefresh: _refresh,
                child: ListView(children: [
                  ListItemCard(name: 'Rae mas', seller: 'Hilman'),
                  ListItemCard(name: 'Bodu boava', seller: 'Hilman'),
                  ListItemCard(name: 'Faru tholhi', seller: 'Hilman'),
                  ListItemCard(name: 'Rae mas', seller: 'Hilman'),
                  ListItemCard(name: 'Bodu boava', seller: 'Hilman'),
                  ListItemCard(name: 'Faru tholhi', seller: 'Hilman'),
                  ListItemCard(name: 'Rae mas', seller: 'Hilman'),
                  ListItemCard(name: 'Bodu boava', seller: 'Hilman'),
                  ListItemCard(name: 'Faru tholhi', seller: 'Hilman')
                ])))
      ],
    );
  }

  Future<Null> _refresh() {
    return null;
  }
}
