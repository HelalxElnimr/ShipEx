import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_new/constantVariable.dart';
import 'Extended/Color.dart';
import 'accountPage/LoginScreen.dart';
class SpalashScreen extends StatefulWidget {
  @override
  _SpalashScreenState createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {


  getCurrentLocation()async{
    await Geolocator.getCurrentPosition().then((value) => {
    setState(() {
    currentPosition=LatLng(value.latitude,value.longitude);

    })

    });
  }


  @override
  void initState(){
    getCurrentLocation();

    Timer(
        Duration(seconds: 5), ()=>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gredintcolorapp,child:
      Container(
      padding: EdgeInsets.only(
          left: 50,
          right: 50,
          bottom: 200),
      child:
       SvgPicture.asset("assets/LogoWhite.svg"),
    ),
    );
  }
}
