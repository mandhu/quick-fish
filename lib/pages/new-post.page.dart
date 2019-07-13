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
  bool isChecked = false;
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
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
      });
    } catch (e){
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Material(
          color: Colors.redAccent,
          child: Container(
            height: 250,
            child: _image == null
                ? InkWell(
              onTap: () {
                getImage();
              },
              child: Center(
                  child: Icon(
                    Icons.add,
                    size: 80,
                    color: Colors.white24,
                  )),
            )
                : Image.file(
              _image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Post new listing',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFCDDFF2),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Product',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFCDDFF2),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Price',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFCDDFF2),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Quantity',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Text('Do you deliver?')
            ],
          )),
        if (isChecked)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFCDDFF2),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Max Delivery distance',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                )
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: MaterialButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text('Post'),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<Null> _refresh() {
    return null;
  }
}
