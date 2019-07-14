import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:http/http.dart' as http;
import 'package:quick_fish/components/navigation-bar.component.dart';

import 'listings.page.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isChecked = false;
  File _image;

  TextEditingController _productController = TextEditingController(text: '2');
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _deliveryDistanceController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

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
      var postUri = Uri.parse("https://freshub.blazing.mv/api/upload");
      var request = new http.MultipartRequest("POST", postUri);
      request.files.add(new http.MultipartFile.fromBytes(
          'file', await image.readAsBytes(),
          contentType: new MediaType('image', 'jpeg')));
      var response = await request.send();
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          var res = json.decode(value);
          _imageController.text = res['data']['url'];
          print(value);
        });
        print("Uploaded! ${response.stream.toString()}");
      }

      print(
          "Uploaded! ${response.statusCode.toString()} ------>  ${response.toString()}");

      setState(() {
        _image = image;
      });
    } catch (e) {
      print('-----------------------------Failed::: $e');
      setState(() {
        _image = null;
      });
    }
  }

  Future postListing() async {
    try {
      // Upload here
      Map data = {
        "product_id": 1.toString(),
        "price": _priceController.text.toString(),
        "quantity": _quantityController.text.toString(),
        "image": _imageController.text.toString(),
        "promoted": false.toString()
      };
      print(data);
      var response = await http.post("https://freshub.blazing.mv/api/listings",
          body: data);
      if (response.statusCode == 200) {
        print('Saved');
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ListingsPage();
        }));
      } else {
        print(
            'failed to save:: CODE: ${response.statusCode}, ${response.body.toString()}');
      }
    } catch (e) {
      print('-----------------------------Failed:: $e');
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
          padding: EdgeInsets.all(0),
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          print(value);
                          _productController.text = value.toString();
                        },
                        value: '1',
                        items: <List>[
                          [1, 'Red Snapper'],
                          [2, 'Tomato'],
                          [3, 'Cabbage'],
                          [4, 'Octopus'],
                          [5, 'Grouper'],
                        ].map((List value) {
                          return new DropdownMenuItem<String>(
                            value: value[0].toString(),
                            child: new Text(value[1]),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 20.0),
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Container(
//                      margin: EdgeInsets.only(right: 20),
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(Radius.circular(4)),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                            color: Color(0xFFEEEEEE),
//                            blurRadius: 2.0,
//                          )
//                        ],
//                      ),
//                      child: TextFormField(
//                        controller: _productController,
//                        style: TextStyle(fontSize: 18),
//                        decoration: InputDecoration(
//                          hintText: 'Product',
//                          hintStyle: TextStyle(color: Colors.black26),
//                          border: InputBorder.none,
//                          contentPadding: EdgeInsets.all(10),
//                          focusedBorder: InputBorder.none,
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                        controller: _priceController,
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
                        controller: _quantityController,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
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
                            controller: _deliveryDistanceController,
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
                        borderRadius: BorderRadius.circular(4)),
                    child: Text('Post'),
                    onPressed: () {
                      postListing();
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Future<Null> _refresh() {
    return null;
  }
}
