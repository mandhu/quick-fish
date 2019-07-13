import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:http/http.dart' as http;
import 'package:quick_fish/components/navigation-bar.component.dart';

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

      // Upload here
      print('Uploadingggggg......../.../././');
      var postUri = Uri.parse("http://10.10.21.154:8000/api/upload");
      print('JSHDKJHAKJDHKJSAHDKSJA......../.../././');
      var request = new http.MultipartRequest("POST", postUri);
      print('123123123123123123......../.../././');
      request.fields['user'] = 'blah';
      request.files.add(new http.MultipartFile.fromBytes(
          'file', await image.readAsBytes(),
          contentType: new MediaType('image', 'jpeg')));
//
      var response = await request.send();
      print('99999999999999......../.../././');
      if (response.statusCode == 200) print("Uploaded! ${response.toString()}");

      print("Uploaded! ${response.statusCode.toString()} ------>  ${response
          .toString()}");

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('-----------------------------Failed');
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(1),
      body: ListView(
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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFEEEEEE),
                              blurRadius: 2.0,
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
                    )
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
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
                  ))
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: MaterialButton(
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Text('Post'),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }

  Future<Null> _refresh() {
    return null;
  }
}
