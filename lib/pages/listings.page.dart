import 'package:flutter/material.dart';
import 'package:quick_fish/components/fish-card.component.dart';

class ListingsPage extends StatefulWidget {
  @override
  _ListingsPageState createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
      children: <Widget>[
        Expanded(child: FishCard(child: Text('Search'))),
      ],
    );
  }
}
