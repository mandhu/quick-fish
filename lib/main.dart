import 'package:flutter/material.dart';
import 'package:quick_fish/pages/listings.page.dart';
import 'package:onesignal/onesignal.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quick Fish',
        theme: ThemeData(
            fontFamily: 'Product Sans',
            primarySwatch: Colors.blue,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
            backgroundColor: Color(0x00F2F8FF)),
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
//    OneSignal.shared.promptUserForPushNotificationPermission();
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.error);
    OneSignal.shared.init("f36282db-c240-4226-b685-25fe5c763668");

    this.checkPermission();

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
      print("==================id");
      print(changes.jsonRepresentation());
    });
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ListingsPage();
      }));    
    });
  }

  void checkPermission() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    try {
      Map data = {
        "user_id": 2.toString(),
        "push_token": status.subscriptionStatus.userId.toString(),
      };
      print(data);
      var response = await http.post("https://freshub.blazing.mv/api/push_token", body: data);
      if (response.statusCode == 200) {
        print('Saved');
      } else {
        print('failed to save:: CODE: ${response.statusCode}, ${response.body.toString()}');
      }
    } catch (e) {
      print('-----------------------------Failed:: $e');

    }
  }

  @override
  Widget build(BuildContext context) {
    return ListingsPage();
  }
}
