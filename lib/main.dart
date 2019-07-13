import 'package:flutter/material.dart';
import 'package:quick_fish/pages/listings.page.dart';
import 'package:quick_fish/pages/new-post.page.dart';
import 'package:quick_fish/pages/profile.page.dart';

import 'pages/details.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Fish',
      theme: ThemeData(
          fontFamily: 'Product Sans',
          primarySwatch: Colors.blue,
          backgroundColor: Color(0x00F2F8FF)),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Fish Quick'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextStyle labelStyle = TextStyle(color: Colors.black45, fontSize: 12);
  final TextStyle activeLabelStyle =
      TextStyle(color: Colors.redAccent, fontSize: 12);
  int selectedPage = 0;

  List pages = [NewPostPage(), ListingsPage(), ProfilePage(), ProductDetailsPage() ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  width: double.infinity, child: pages[selectedPage])),
        ],
      ),
      bottomNavigationBar: Container(
        height: 57,
        decoration: new BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0xFFCDDFF2),
            blurRadius: 10.0,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                setState(() {
                  selectedPage = 0;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home,
                      color: selectedPage == 0
                          ? Colors.redAccent
                          : Colors.black45),
                  Text('Home',
                      style: selectedPage == 0 ? activeLabelStyle : labelStyle)
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  selectedPage = 1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.list,
                      color: selectedPage == 1
                          ? Colors.redAccent
                          : Colors.black45),
                  Text('Listing',
                      style: selectedPage == 1 ? activeLabelStyle : labelStyle)
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  selectedPage = 2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.account_circle,
                      color: selectedPage == 2
                          ? Colors.redAccent
                          : Colors.black45),
                  Text('Profile',
                      style: selectedPage == 2 ? activeLabelStyle : labelStyle)
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
//                  selectedPage = 3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('\$ 100.00', style: TextStyle(fontSize: 20)),
                  Text(
                    'Your balance',
                    style: labelStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
