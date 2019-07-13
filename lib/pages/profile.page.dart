import 'package:flutter/material.dart';
import 'package:quick_fish/components/fish-card.component.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isChecked = false;

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 350,
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ClipRRect(
                  borderRadius: new BorderRadius.circular(100),
                  child: Image.network(
                    'http://placekitten.com/150/150',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  )),
            ),
            Positioned(
              top: 100,
              height: 330,
              width: 330,
              child: IconButton(
                  icon: Icon(Icons.camera_alt, size: 60,),
                  onPressed: () {},
              ),
            )
          ]),
        )
      ],
    );
  }
}
