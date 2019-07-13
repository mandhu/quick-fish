import 'package:flutter/material.dart';
import 'package:quick_fish/components/fish-card.component.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 230,
            color: Color(0xff3B85D2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Red Snapper',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '5 mins ago',
                style: TextStyle(fontSize: 12, color: Color(0xff4B88DA)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Fisherman X',
            style: TextStyle(fontSize: 12, color: Color(0xff4B88DA)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '\$ 100',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5FB405)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
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
              MaterialButton(
                color: Color(0xff3B85D2),
                textColor: Colors.white,
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text('BUY NOW'),
                onPressed: () {},
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
        
        TextField(
          decoration: InputDecoration(
            labelText: 'Address'
          ),
          maxLines: null,
          keyboardType: TextInputType.multiline,
        )
      ],
    );
  }
}
