import 'package:flutter/material.dart';
import 'package:quick_fish/pages/listings.page.dart';
import 'package:quick_fish/pages/new-post.page.dart';
import 'package:quick_fish/pages/profile.page.dart';
import 'package:quick_fish/pages/subscriptions.page.dart';

class NavigationBar extends StatelessWidget {
  final int selectedPage;
  final TextStyle labelStyle = TextStyle(color: Colors.black45, fontSize: 12);
  final TextStyle activeLabelStyle =
  TextStyle(color: Colors.redAccent, fontSize: 12);

  NavigationBar(this.selectedPage);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ListingsPage();
              }));
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
            onPressed: selectedPage != 1 ? () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return NewPostPage();
              }));
            } : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add,
                    color: selectedPage == 1
                        ? Colors.redAccent
                        : Colors.black45),
                Text('Add Listing',
                    style: selectedPage == 1 ? activeLabelStyle : labelStyle)
              ],
            ),
          ),
          MaterialButton(
            onPressed: selectedPage != 2 ? () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return SubscriptionsPage();
              }));
            } : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.notifications,
                    color: selectedPage == 2
                        ? Colors.redAccent
                        : Colors.black45),
                Text('Notifications',
                    style: selectedPage == 2 ? activeLabelStyle : labelStyle)
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ProfilePage();
              }));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('\$ 300.00', style: TextStyle(fontSize: 20)),
                Text(
                  'Your balance',
                  style: labelStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
