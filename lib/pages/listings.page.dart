import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';

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
                    displacement: 0,
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: ListView(padding: EdgeInsets.all(0), children: [
                      ListItemCard(name: 'Rae mas', seller: 'Hilman', tag: 'hero',),
                      ListItemCard(name: 'Bodu boava', seller: 'Hilman', tag: 'jalsddf-ka',),
                      ListItemCard(name: 'Faru tholhi', seller: 'Hilman', tag: 'jaldfsd80ka',),
                      ListItemCard(name: 'Rae mas', seller: 'Hilman', tag: 'jalsdk6ad8f',),
                      ListItemCard(name: 'Bodu boava', seller: 'Hilman', tag: 'jaldfs2dka',),
                      ListItemCard(name: 'Faru tholhi', seller: 'Hilman', tag: 'jaldf52sdka',),
                      ListItemCard(name: 'Rae mas', seller: 'Hilman', tag: 'jaldfsdk4a',),
                      ListItemCard(name: 'Bodu boava', seller: 'Hilman', tag: 'jadflsssdfdka',),
                      ListItemCard(name: 'Faru tholhi', seller: 'Hilman', tag: 'jaldfsdfgfgfgka',)
                    ])))
          ],
        ),
        bottomNavigationBar: NavigationBar(0)
    );
  }

  Future<Null> _refresh() {
    return null;
  }
}
