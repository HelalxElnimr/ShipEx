import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_new/Extended/Color.dart';
import 'package:whatsapp_new/Extended/Drawerr.dart';
import 'package:whatsapp_new/ScreensApp/MapScreen.dart';

class fromToScreen extends StatefulWidget {
  @override
  _fromToScreenState createState() => _fromToScreenState();
}

class _fromToScreenState extends State<fromToScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
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
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
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
                      onTap: () {},
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
          Positioned(
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
                    onTap: () {},
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
                          Text("From:",
                              style: TextStyle(
                                  color: primrycolor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          Text("mansoura",
                              style: TextStyle(
                                  color: Colors.blue[400],
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
                    onTap: () {},
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
                          Text("To:",
                              style: TextStyle(
                                  color: primrycolor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          Text("egypt",
                              style: TextStyle(
                                  color: Colors.blue[400],
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
