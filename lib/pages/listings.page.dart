import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';
import 'package:http/http.dart' as http;
//import 'package:firebase_messaging/firebase_messaging.dart';

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

  List<Post> posts;
//  final FirebaseMessaging _fcm = FirebaseMessaging();

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  loadItems() async {
    var res = await http.get('http://10.10.21.185:8000/api/listings');

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
                    child: ListView(padding: EdgeInsets.all(0), children: [
                      ListItemCard(
                        name: 'Rae mas',
                        seller: 'Hilman',
                        tag: 'hero',
                      ),
                      ListItemCard(
                        name: 'Bodu boava',
                        seller: 'Hilman',
                        tag: 'jalsddf-ka',
                      ),
                      ListItemCard(
                        name: 'Faru tholhi',
                        seller: 'Hilman',
                        tag: 'jaldfsd80ka',
                      ),
                      ListItemCard(
                        name: 'Rae mas',
                        seller: 'Hilman',
                        tag: 'jalsdk6ad8f',
                      ),
                      ListItemCard(
                        name: 'Bodu boava',
                        seller: 'Hilman',
                        tag: 'jaldfs2dka',
                      ),
                      ListItemCard(
                        name: 'Faru tholhi',
                        seller: 'Hilman',
                        tag: 'jaldf52sdka',
                      ),
                      ListItemCard(
                        name: 'Rae mas',
                        seller: 'Hilman',
                        tag: 'jaldfsdk4a',
                      ),
                      ListItemCard(
                        name: 'Bodu boava',
                        seller: 'Hilman',
                        tag: 'jadflsssdfdka',
                      ),
                      ListItemCard(
                        name: 'Faru tholhi',
                        seller: 'Hilman',
                        tag: 'jaldfsdfgfgfgka',
                      )
                    ])))
          ],
        ),
        bottomNavigationBar: NavigationBar(0));
  }

  Future<Null> _refresh() {
    return null;
  }
}


class Post {
  final tripNo;
  final bookable;
  final cancelled;
  final capacity;
  final price;
  final from;
  final to;
  final departure;
  final transit;
  final boat;
  final ticketCounts;

  Post(
      {this.tripNo,
        this.bookable,
        this.cancelled,
        this.capacity,
        this.price,
        this.from,
        this.to,
        this.departure,
        this.transit,
        this.boat,
        this.ticketCounts});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        tripNo: json['tripNo'],
        bookable: json['bookable'],
        cancelled: json['cancelled'],
        capacity: json['capacity'],
        price: json['price'],
        from: json['from'],
        to: json['to'],
        departure: json['departure'],
        transit: json['transit'],
        boat: json['boat'],
        ticketCounts: json['ticketCounts']);
  }
}

