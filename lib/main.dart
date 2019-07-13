import 'package:flutter/material.dart';
import 'package:quick_fish/pages/listings.page.dart';

import 'components/nav.component.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Fish',
      theme: ThemeData(
        fontFamily: 'Product Sans',
        primarySwatch: Colors.blue,
        backgroundColor: Color(0x00F2F8FF)
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListingsPage(),
      bottomNavigationBar: NavigatorComponent(),
    );
  }
}
