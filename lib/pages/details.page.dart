import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_fish/components/fish-card.component.dart';
import 'package:quick_fish/components/navigation-bar.component.dart';
import 'package:http/http.dart' as http;
import 'package:quick_fish/components/payment.component.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../listing.dart';

class ProductDetailsPage extends StatefulWidget {
  final String heroTag;
  final int id;

  ProductDetailsPage(this.heroTag, this.id);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isChecked = false;
  var listing;
  int selectedPage = 1;
  final TextStyle labelStyle = TextStyle(color: Colors.black45, fontSize: 12);
  final TextStyle activeLabelStyle =
      TextStyle(color: Colors.redAccent, fontSize: 12);

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    loaditem();
    super.initState();
  }

   Future<List<Listing>> loaditem() async {
     print(widget.heroTag);
    final response = await http.get('https://freshub.blazing.mv/api/listings/${widget.id}');
    if (response.statusCode == 200) {
      listing = (json.decode(response.body)['data']);
      // final List<Listing> loaditems = [];
      // for (var item in json.decode(response.body)['data']) {
      //   loaditems.add(Listing.fromJson(item));
      // }
      setState(() {
        // listings = loaditems;
      });
      return null;
      // return loaditems;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        listing != null ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.heroTag,
              child: Container(
                height: 230,
                child: Image.network(
                  'https://freshub.blazing.mv/storage${listing["image"]}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.only(top: 15, right: 30, bottom: 15, left: 15),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        listing['product']['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(timeago.format(DateTime.parse(listing['created_at'])),
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff4B88DA)),
                      ),
                    ],
                  ),
                  Text(
                    listing['seller']['name'],
                    style: TextStyle(fontSize: 12, color: Color(0xff4B88DA)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\$${listing["price"]}',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff5FB405)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      Text('Delivery?')
                    ],
                  ),
                  if (isChecked)
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFCDDFF2),
                              blurRadius: 5.0,
                            )
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Address',
                            contentPadding: EdgeInsets.all(15),
                            focusedBorder: InputBorder.none,
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          textColor: Colors.redAccent,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Subscribe', style: TextStyle(fontWeight: FontWeight.bold)),
                          onPressed: () {
//                            _settingModalBottomSheet(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text('BUY NOW', style: TextStyle(fontWeight: FontWeight.bold),),
                          onPressed: () {
                            _settingModalBottomSheet(context);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ): Center(child: Text('Loading..')),
        bottomNavigationBar: NavigationBar(0));
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: PaymentBox(),
                )),
          );
        }
    );
  }
}
