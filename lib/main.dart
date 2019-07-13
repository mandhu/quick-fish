import 'package:flutter/material.dart';
import 'package:quick_fish/pages/listings.page.dart';
import 'package:quick_fish/pages/new-post.page.dart';
import 'package:quick_fish/pages/profile.page.dart';

import 'components/navigation-bar.component.dart';
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
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;

  List pages = [
    NewPostPage(),
    ListingsPage(),
    ProfilePage()
  ];

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
      bottomNavigationBar: NavigationBar(0)
    );
  }
}
