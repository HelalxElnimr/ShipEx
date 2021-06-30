import 'package:flutter/material.dart';
import 'file:///C:/Users/Mostafa/AndroidStudioProjects/shipex/lib/ScreensApp/MapScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BottomNavBarV2(),
          /*
      GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),

        ),
      ),*/
    );
  }
}
