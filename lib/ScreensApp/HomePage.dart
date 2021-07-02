import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_new/constantVariable.dart';

import 'MapScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getCurrentLocation()async{
    await Geolocator.getCurrentPosition().then((value) => {
      setState(() {
        currentPosition=LatLng(value.latitude,value.longitude);

      })

    });
  }
@override
  void initState() {
  getCurrentLocation();
    // TODO: implement initState
    super.initState();
  }

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
