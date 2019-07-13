import 'package:flutter/material.dart';

class FishCard extends StatelessWidget {
  final Widget child;
  final double padding;
  final EdgeInsets margin;

  FishCard({this.child, this.padding = 15, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: margin,
        width: double.infinity,
        decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFCDDFF2),
                blurRadius: 20.0,
              )
            ],
            borderRadius: new BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
