import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_new/accountPage/FromToScreen.dart';
import 'package:whatsapp_new/accountPage/OrderDetails.dart';
import 'package:whatsapp_new/constantVariable.dart';
import '../Extended/Color.dart';
import '../Extended/Drawerr.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';


class ShipmentOrderList extends StatefulWidget {
  @override
  _ShipmentOrderListState createState() => _ShipmentOrderListState();
}

class _ShipmentOrderListState extends State<ShipmentOrderList> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;




  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
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
      body: ListView(
        children: [

          itemOrder(title:"T-shirt",day: "today",weight: "50g",price: "100" ,status: "Waiting")



        ],
      ),
    );
  }

  Widget itemOrder(
      {String title, String day, String weight, String price, String status}){
    return Container(
     decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(color: primrycolor, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_downward_outlined),
                Text(title,style: TextStyle(
                  fontSize: 15,
                  color: Colors.indigo,

                ),),


              ],
            ),
            Row(
              children: [
                Text(day,style: TextStyle(
                  fontSize: 15,
                  color: Colors.indigo,

                ),),
                Icon(Icons.keyboard_arrow_down_outlined),



              ],
            ),
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(weight,style: TextStyle(
                fontSize: 15,
                color: Colors.indigo,

              ),),
              Row(
                children: [
                  Icon(Icons.check_circle,color: Colors.green,),
                  Text("Paid ",style: TextStyle(
                    fontSize: 15,
                    color:primrycolor,

                  ),),
                  Text(price,style: TextStyle(
                    fontSize: 15,
                    color: primrycolor,

                  ),),


                ],
              ),
              Row(
                children: [

                  Icon(Icons.stacked_line_chart,color: primrycolor,),
                  Text(status,style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,

                  ),),


                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}


