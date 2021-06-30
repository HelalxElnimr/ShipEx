import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_new/ScreensApp/HomePage.dart';
import 'ScreensApp/MapScreen.dart';
import 'Extended/Color.dart';
import 'ScreensApp/main.dart';
import 'ScreensApp/tesst.dart';
import 'accountPage/LoginScreen.dart';
import 'SpalashScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ShipEx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primrycolor,
        splashColor: primrycolor,
          brightness: Brightness.light,
          unselectedWidgetColor:primrycolor,
      ),
      home: HomePage()
    );
  }

}

