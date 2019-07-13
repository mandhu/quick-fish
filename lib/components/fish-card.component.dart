import 'package:flutter/material.dart';

class FishCard extends StatelessWidget {
  final Widget child;
  final double padding;

  FishCard({this.child, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0))),
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
