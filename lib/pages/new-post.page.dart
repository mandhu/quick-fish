import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quick_fish/components/boosted-item.component.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/listing-item.component.dart';
import 'package:image_picker_modern/image_picker_modern.dart';


class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  File _image;

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

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            color: Colors.blueAccent,
            child: Container(
              height: 250,
              child: _image == null
                  ? InkWell(
                onTap: () {
                  getImage();
                },
                child: Center(child: Icon(Icons.add, size: 80, color: Colors.white24,)),
              ) : Image.file(_image, fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Post new listing', style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 20,),

        ],
      );
  }

  Future<Null> _refresh() {
    return null;
  }
}
