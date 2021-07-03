import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_new/accountPage/FromToScreen.dart';
import 'package:whatsapp_new/accountPage/OrderDetails.dart';
import 'package:whatsapp_new/accountPage/calculate_price.dart';
import 'package:whatsapp_new/constantVariable.dart';
import '../Extended/Color.dart';
import '../Extended/Drawerr.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';


class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
bool targetLocationClick=true;


  Map<PolylineId, Polyline> polyline = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCIOsKC8hY4KBzB7AVNIzpBjXtFNxxc_38";
  Uint8List markerIcon;
  bool showFromTo=false;


  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec =
    await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  Future<void> _addMarkerCurrentLocation(LatLng position) async {
    var markerIdVal = "current";
    final MarkerId markerId = MarkerId(markerIdVal);
    markerIcon = await getBytesFromAsset('assets/004-marker.png', 100);
    // creating a new MARKER
    final Marker marker = Marker(
      icon: BitmapDescriptor.fromBytes(markerIcon),
      // icon:BitmapDescriptor.defaultMarkerWithHue(10),
      markerId: markerId,
      position: LatLng(position.latitude,position.longitude),

      infoWindow: InfoWindow(
        title:"on tap",
      ),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
    _getPolyline();
  }


  Future<void> _addMarkerTargetLocation(LatLng position) async {
    var markerIdVal = "target";
    final MarkerId markerId = MarkerId(markerIdVal);
    markerIcon = await getBytesFromAsset('assets/002-map-marker.png', 100);
    // creating a new MARKER
    final Marker marker = Marker(
      icon: BitmapDescriptor.fromBytes(markerIcon),
      // icon:BitmapDescriptor.defaultMarkerWithHue(10),
      markerId: markerId,
      position: LatLng(position.latitude,position.longitude),

      infoWindow: InfoWindow(
        title:"on tap",
      ),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
    _getPolyline();
  }

  getDistance(LatLng firstPosition,LatLng secondPosition){

     var distance= Geolocator.distanceBetween(firstPosition.latitude, firstPosition.longitude,secondPosition.latitude,  secondPosition.longitude);
     print("distance ${distance}");

  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline1 = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polyline[id] = polyline1;
    setState(() {});
  }

  _getPolyline() async {
    // print("$googleAPiKey ${currentPosition.latitude}, ${currentPosition.longitude}");

    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(  googleAPiKey,0, 0,  markers[MarkerId('marker')].position.latitude,  markers[MarkerId('marker')].position.longitude);
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }


  @override
  void initState() {
    _addMarkerCurrentLocation(currentPosition);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white.withAlpha(55),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(
                0xff018d5f), //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawerr()),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 40),
            height: 70,
            width: 70,
            child: SvgPicture.asset(
              "assets/icons/Icons- menu.svg",
            ),
          ),
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        leadingWidth: 80,
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 30),
            height: 44,
            width: 40,
            child: SvgPicture.asset("assets/icons/notifcation_icon.svg"),
          ),
        ],
        // IconButton(
        //   icon: Icon(Icons.menu, size: 40),
        //
        //   onPressed: () {
        //     _scaffoldKey.currentState.openDrawer();
        //   },
        // ),
        toolbarHeight: MediaQuery.of(context).size.height / 6,
        elevation: 0,
        flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff00F388),
                    Color(0xff01DB91),
                  ]),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: 90,
                width: 90,
                child: SvgPicture.asset("assets/LogoWhite.svg"),
              ),
            )),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 125),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(currentPosition.latitude??37.43296265331129,currentPosition.longitude?? -122.08832357078792),

                zoom: 15.5

              ),
              onTap: (position){
                if(targetLocationClick){
                  _addMarkerTargetLocation(position);
                }else{
                  _addMarkerCurrentLocation(position);
                }

              },
              markers: Set<Marker>.of(markers.values),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              polylines: Set<Polyline>.of(polyline.values),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: GestureDetector(
                      onTap: () {
                        // getDistance();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CalculatePrice()),
                        );
                      },
                      child: Container(
                        width: 57,
                        height: 57,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff00FF88),
                                  Color(0xff01DB91),
                                  Color(0xff01BC98),
                                ]),
                            borderRadius: BorderRadius.circular(35)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            size: 35,
                            color: currentIndex == 0
                                ? selctedcoloricon
                                : primrycolor,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            "assets/icons/car.svg",
                            height: 25,
                            color: currentIndex == 1
                                ? selctedcoloricon
                                : primrycolor,
                          ),
                          onTap: () {
                            setBottomBarIndex(1);
                          },
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.settings,
                              size: 35,
                              color: currentIndex == 2
                                  ? selctedcoloricon
                                  : primrycolor,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.person,
                              size: 35,
                              color: currentIndex == 3
                                  ? selctedcoloricon
                                  : primrycolor,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
         Positioned(
              child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular(35.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff01DB91),
                    Color(0xff01BC98),
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    'Hello Sir,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    'Good Morning,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                ),
              ],
            ),
          )),
          showFromTo?SizedBox(width: 0,height: 0,):  Positioned(
            top: 150,
            left: 20,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFromTo=!showFromTo;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => fromToScreen()),
                      // );
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primrycolor, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          SvgPicture.asset("assets/icons/Sendicon.svg"),
                          Text("Send",
                              style: TextStyle(
                                  color: primrycolor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          SvgPicture.asset("assets/icons/Sendpath.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFromTo=!showFromTo;
                      });
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primrycolor, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset("assets/icons/ReceiveIcon.svg"),
                          Text("Receive",
                              style: TextStyle(
                                  color: primrycolor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          SvgPicture.asset("assets/icons/Sendpath.svg"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          !showFromTo?SizedBox(width: 0,height: 0,):Positioned(
            top: 380,
            left: 20,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        targetLocationClick=false;
                        // showFromTo=!showFromTo;
                      });
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color:targetLocationClick?Colors.white: primrycolor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primrycolor, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          SvgPicture.asset("assets/icons/Sendicon.svg"),
                          Text("From:",
                              style: TextStyle(
                                  color:targetLocationClick?primrycolor:Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          Text("${markers[MarkerId('current')].position.latitude.toStringAsFixed(3)} , ${markers[MarkerId('current')].position.longitude.toStringAsFixed(3)}",
                              style: TextStyle(
                                  color:targetLocationClick? Colors.blue[400]:Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SvgPicture.asset("assets/icons/SearchIcon.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        targetLocationClick=true;
                        // showFromTo=!showFromTo;
                      });
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color:targetLocationClick?primrycolor.withOpacity(.8):Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primrycolor, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset("assets/icons/ReceiveIcon.svg"),
                          Text("To:",
                              style: TextStyle(
                                  color:targetLocationClick?Colors.white:primrycolor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          Text("${markers[MarkerId('target')].position.latitude.toStringAsFixed(3)} , ${markers[MarkerId('target')].position.longitude.toStringAsFixed(3)}",
                              style: TextStyle(
                                  color:targetLocationClick?Colors.white:Colors.blue[400],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SvgPicture.asset("assets/icons/SearchIcon.svg"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(35), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
