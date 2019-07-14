import 'package:flutter/material.dart';

import 'fish-card.component.dart';
import 'package:timeago/timeago.dart' as timeago;

class PaymentBox extends StatefulWidget {
  final dynamic id;

  PaymentBox({this.id});

  @override
  _PaymentBoxState createState() => _PaymentBoxState();
}

class _PaymentBoxState extends State<PaymentBox> {
  bool done = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return done ? Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Payment Complete', style: TextStyle(fontSize: 20)),
        Icon(Icons.check_circle, color: Colors.green, size: 40,),
        Text('Your balance', style: TextStyle(fontSize: 16, color: Colors.black45)),
        Text('\$ 830.00', style: TextStyle(fontSize: 22)),
        SizedBox(
          height: 12,
        ),
        MaterialButton(
          color: Color(0xff3B85D2),
          textColor: Colors.white,
          padding: const EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text('Done'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ): Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Buy Item', style: TextStyle(fontSize: 20)),
        Text('Price: \$ 203.00', style: TextStyle(fontSize: 16, color: Colors.black45)),
        Text('TOTAL \$ 203.00',
            style: TextStyle(fontSize: 18, color: Colors.green)),
        Text('Your balance', style: TextStyle(fontSize: 16, color: Colors.black45)),
        Text('\$ 930.00', style: TextStyle(fontSize: 22)),
        SizedBox(
          height: 12,
        ),
        MaterialButton(
          color: Color(0xff3B85D2),
          textColor: Colors.white,
          padding: const EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text('Confirm payment'),
          onPressed: () {
            setState(() {
              done = true;
            });
          },
        ),
      ],
    );
  }
}
