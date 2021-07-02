import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_new/accountPage/FromToScreen.dart';
import 'package:whatsapp_new/accountPage/OrderDetails.dart';
import 'package:whatsapp_new/accountPage/rate_dialog.dart';
import 'package:whatsapp_new/constantVariable.dart';
import '../Extended/Color.dart';
import '../Extended/Drawerr.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';


class CalculatePrice extends StatefulWidget {

  @override
  _CalculatePriceState createState() => _CalculatePriceState();
}

class _CalculatePriceState extends State<CalculatePrice> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String>  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

List<String> time=['AM','PM'];
  String monthValueDropdown;
  String yearValueDropdown;
  String dayValueDropdown;
  String hourValueDropdown;
  String minuteValueDropdown;
  String timeValueDropdown;
  String heightValueDropdown;
  String widthValueDropdown;
  String lengthValueDropdown;


  @override
  void initState() {

// widget.price;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
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
                  target: LatLng(currentPosition.latitude??0,currentPosition.longitude??0),
                  zoom: 15.5

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

              )),
          Positioned(
            top: 40,
              right: 5,
              left: 5,

              child: Container(
                height: height*.7-30,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),


                ),
                child:  ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(height: 10,),

                        Column(

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on,color: primrycolor,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("From",style: TextStyle(
                                        color: primrycolor,fontFamily: 'Raleway ',fontSize: 18
                                    ),),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("My Location Address",style: TextStyle(
                                        color: Colors.black,fontFamily: 'Raleway ',fontSize: 12,fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(" Address",style: TextStyle(
                                        color: Colors.black,fontFamily: 'Raleway ',fontSize: 12
                                    ),),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on,color: Colors.pink,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("To",style: TextStyle(
                                        color: primrycolor,fontFamily: 'Raleway ',fontSize: 18
                                    ),),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("My Location Address",style: TextStyle(
                                        color: Colors.black,fontFamily: 'Raleway ',fontSize: 12,fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(" Address",style: TextStyle(
                                        color: Colors.black,fontFamily: 'Raleway ',fontSize: 12
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                          Divider(
                            height: 20,
                            indent: 20,
                            endIndent: 20,
                            thickness: 3,
                          ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Date",style: TextStyle(
                             color: Colors.black ,fontSize: 25
                         ),),
                         SizedBox(height: 10,),

                         // _buildScrollWheel(),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 5,),

                               decoration: BoxDecoration(
                                 border: Border.all(color: primrycolor,width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(20),),
                               ),
                               child: Row(
                                 children: [
                                   Container(
                                     height: 50,
                                     width:width*.25 ,
                                     child: DropdownButton<String>(
                                       value: monthValueDropdown,
                                       isExpanded: true,
                                       iconEnabledColor:Colors.grey,
                                       iconSize:20,
                                       icon:Icon(Icons.keyboard_arrow_down_rounded,size: 25,),

                                       underline: Container(
                                         height: 0,
                                         color: Colors.transparent,
                                       ),
                                       onChanged: (String newValue) {

                                         setState(() {
                                           monthValueDropdown=newValue;
                                         });
                                       },
                                       onTap: () {
                                         FocusScope.of(context)
                                             .requestFocus(FocusNode());
                                       },
                                       items:
                                       months.map<DropdownMenuItem<String>>(
                                               (String value) {
                                             return DropdownMenuItem<String>(
                                               value: value.toString(),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 textDirection: TextDirection.rtl,
                                                 children: [
                                                   Expanded(
                                                     flex: 2,
                                                     child: Padding(
                                                       padding: const EdgeInsets.symmetric(horizontal: 3),
                                                       child: Text(
                                                         ('$value'),
                                                         style: TextStyle(
                                                             fontSize: 12,
                                                             color: Colors.black),
                                                         textAlign: TextAlign.right,
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             );
                                           }).toList(),
                                     ),
                                   ),
                                   Container(
                                     height: 50,
                                     width:width*.25 ,
                                     child: DropdownButton<String>(
                                       value: dayValueDropdown,
                                       isExpanded: true,
                                       iconEnabledColor:Colors.grey,
                                       iconSize:20,
                                       icon:Icon(Icons.keyboard_arrow_down_rounded,size: 25,),

                                       underline: Container(
                                         height: 0,
                                         color: Colors.transparent,
                                       ),
                                       onChanged: (String newValue) {

                                         setState(() {
                                           dayValueDropdown=newValue;
                                         });
                                       },
                                       onTap: () {
                                         FocusScope.of(context)
                                             .requestFocus(FocusNode());
                                       },
                                       items:
                                       List.generate(30, (index) => '${index+1}').map<DropdownMenuItem<String>>(
                                               (String value) {
                                             return DropdownMenuItem<String>(
                                               value: value.toString(),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 textDirection: TextDirection.rtl,
                                                 children: [
                                                   Expanded(
                                                     flex: 2,
                                                     child: Padding(
                                                       padding: const EdgeInsets.symmetric(horizontal: 3),
                                                       child: Text(
                                                         ('$value'),
                                                         style: TextStyle(
                                                             fontSize: 12,
                                                             color: Colors.black),
                                                         textAlign: TextAlign.right,
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             );
                                           }).toList(),
                                     ),
                                   ),
                                   Container(
                                     height: 50,
                                     width:width*.25 ,
                                     child: DropdownButton<String>(
                                       value: yearValueDropdown,
                                       isExpanded: true,
                                       iconEnabledColor:Colors.grey,
                                       iconSize:20,
                                       icon:Icon(Icons.keyboard_arrow_down_rounded,size: 25,),

                                       underline: Container(
                                         height: 0,
                                         color: Colors.transparent,
                                       ),
                                       onChanged: (String newValue) {

                                         setState(() {
                                           yearValueDropdown=newValue;
                                         });
                                       },
                                       onTap: () {
                                         FocusScope.of(context)
                                             .requestFocus(FocusNode());
                                       },
                                       items:
                                       List.generate(50, (index) => '${index+2000}').map<DropdownMenuItem<String>>(
                                               (String value) {
                                             return DropdownMenuItem<String>(
                                               value: value.toString(),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 textDirection: TextDirection.rtl,
                                                 children: [
                                                   Expanded(
                                                     flex: 2,
                                                     child: Padding(
                                                       padding: const EdgeInsets.symmetric(horizontal: 3),
                                                       child: Text(
                                                         ('$value'),
                                                         style: TextStyle(
                                                             fontSize: 12,
                                                             color: Colors.black),
                                                         textAlign: TextAlign.right,
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             );
                                           }).toList(),
                                     ),
                                   ),


                                 ],
                               ),

                             ),
                             Icon(Icons.hourglass_full,color: primrycolor,)
                           ],
                         ),

                         Row(
                           children: [

                             Container(
                               height: 50,
                               width:width*.25 ,
                               margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                               decoration: BoxDecoration(
                                 border: Border.all(color: primrycolor,width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(15),),
                               ),
                               child: DropdownButton<String>(
                                 value: hourValueDropdown,
                                 isExpanded: true,
                                 iconEnabledColor:Colors.grey,
                                 iconSize:15,
                                 icon: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.keyboard_arrow_up_outlined),

                                     Icon(Icons.keyboard_arrow_down_outlined),
                                   ],
                                 ),

                                 underline: Container(
                                   height: 0,
                                   color: Colors.transparent,
                                 ),
                                 onChanged: (String newValue) {

                                   setState(() {
                                     hourValueDropdown=newValue;
                                   });
                                 },
                                 onTap: () {
                                   FocusScope.of(context)
                                       .requestFocus(FocusNode());
                                 },
                                 items:
                                 List.generate(24, (index) => '$index').map<DropdownMenuItem<String>>(
                                         (String value) {
                                       return DropdownMenuItem<String>(
                                         value: value.toString(),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           textDirection: TextDirection.rtl,
                                           children: [
                                             Expanded(
                                               flex: 2,
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 3),
                                                 child: Text(
                                                   ('$value'),
                                                   style: TextStyle(
                                                       fontSize: 12,
                                                       color: Colors.black),
                                                   textAlign: TextAlign.right,
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       );
                                     }).toList(),
                               ),
                             ),
                             Container(
                               height: 50,
                               width:width*.25 ,
                               margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                               decoration: BoxDecoration(
                                 border: Border.all(color: primrycolor,width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(15),),
                               ),
                               child: DropdownButton<String>(
                                 value: minuteValueDropdown,
                                 isExpanded: true,
                                 iconEnabledColor:Colors.grey,
                                 iconSize:15,
                                 icon: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.keyboard_arrow_up_outlined),

                                     Icon(Icons.keyboard_arrow_down_outlined),
                                   ],
                                 ),

                                 underline: Container(
                                   height: 0,
                                   color: Colors.transparent,
                                 ),
                                 onChanged: (String newValue) {

                                   setState(() {
                                     minuteValueDropdown=newValue;
                                   });
                                 },
                                 onTap: () {
                                   FocusScope.of(context)
                                       .requestFocus(FocusNode());
                                 },
                                 items:
                                 List.generate(60, (index) => '$index').map<DropdownMenuItem<String>>(
                                         (String value) {
                                       return DropdownMenuItem<String>(
                                         value: value.toString(),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           textDirection: TextDirection.rtl,
                                           children: [
                                             Expanded(
                                               flex: 2,
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 3),
                                                 child: Text(
                                                   ('$value'),
                                                   style: TextStyle(
                                                       fontSize: 12,
                                                       color: Colors.black),
                                                   textAlign: TextAlign.right,
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       );
                                     }).toList(),
                               ),
                             ),
                             Container(
                               height: 50,
                               width:width*.25 ,
                               margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                               decoration: BoxDecoration(
                                 border: Border.all(color: primrycolor,width: 2),
                                 borderRadius: BorderRadius.all(Radius.circular(15),),
                               ),
                               child: DropdownButton<String>(
                                 value: timeValueDropdown,
                                 isExpanded: true,
                                 iconEnabledColor:Colors.grey,
                                 iconSize:15,
                                 icon: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.keyboard_arrow_up_outlined),

                                     Icon(Icons.keyboard_arrow_down_outlined),
                                   ],
                                 ),

                                 underline: Container(
                                   height: 0,
                                   color: Colors.transparent,
                                 ),
                                 onChanged: (String newValue) {

                                   setState(() {
                                     timeValueDropdown=newValue;
                                   });
                                 },
                                 onTap: () {
                                   FocusScope.of(context)
                                       .requestFocus(FocusNode());
                                 },
                                 items:
                                 time.map<DropdownMenuItem<String>>(
                                         (String value) {
                                       return DropdownMenuItem<String>(
                                         value: value.toString(),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           textDirection: TextDirection.rtl,
                                           children: [
                                             Expanded(
                                               flex: 2,
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(horizontal: 3),
                                                 child: Text(
                                                   ('$value'),
                                                   style: TextStyle(
                                                       fontSize: 12,
                                                       color: Colors.black),
                                                   textAlign: TextAlign.right,
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       );
                                     }).toList(),
                               ),
                             ),


                           ],
                         ),
                       ],
                     ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        Text("Size",style: TextStyle(

            color: Colors.black ,fontSize: 25

        ),),

        Icon(Icons.add_box_rounded,color: primrycolor,)



      ],

    ),
                              Row(
                                children: [

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width:width*.25 ,
                                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: primrycolor,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(15),),
                                        ),
                                        child: DropdownButton<String>(
                                          value: heightValueDropdown,
                                          isExpanded: true,
                                          iconEnabledColor:Colors.grey,
                                          iconSize:15,
                                          icon: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.keyboard_arrow_up_outlined),

                                              Icon(Icons.keyboard_arrow_down_outlined),
                                            ],
                                          ),

                                          underline: Container(
                                            height: 0,
                                            color: Colors.transparent,
                                          ),
                                          onChanged: (String newValue) {

                                            setState(() {
                                              heightValueDropdown=newValue;
                                            });
                                          },
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          },
                                          items:
                                          List.generate(3, (index) => '$index').map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.toString(),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    textDirection: TextDirection.rtl,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 3),
                                                          child: Text(
                                                            ('$value'),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black),
                                                            textAlign: TextAlign.right,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('height',style: TextStyle(

                                            color: Colors.black ,fontSize: 8

                                        ),),
                                      )

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width:width*.25 ,
                                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: primrycolor,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(15),),
                                        ),
                                        child: DropdownButton<String>(
                                          value: widthValueDropdown,
                                          isExpanded: true,
                                          iconEnabledColor:Colors.grey,
                                          iconSize:15,
                                          icon: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.keyboard_arrow_up_outlined),

                                              Icon(Icons.keyboard_arrow_down_outlined),
                                            ],
                                          ),

                                          underline: Container(
                                            height: 0,
                                            color: Colors.transparent,
                                          ),
                                          onChanged: (String newValue) {

                                            setState(() {
                                              widthValueDropdown=newValue;
                                            });
                                          },
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          },
                                          items:
                                          List.generate(6, (index) => '$index').map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.toString(),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    textDirection: TextDirection.rtl,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 3),
                                                          child: Text(
                                                            ('$value'),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black),
                                                            textAlign: TextAlign.right,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('width',style: TextStyle(

                                            color: Colors.black ,fontSize: 8

                                        ),),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width:width*.25 ,
                                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: primrycolor,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(15),),
                                        ),
                                        child: DropdownButton<String>(
                                          value: lengthValueDropdown,
                                          isExpanded: true,
                                          iconEnabledColor:Colors.grey,
                                          iconSize:15,
                                          icon: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.keyboard_arrow_up_outlined),

                                              Icon(Icons.keyboard_arrow_down_outlined),
                                            ],
                                          ),

                                          underline: Container(
                                            height: 0,
                                            color: Colors.transparent,
                                          ),
                                          onChanged: (String newValue) {

                                            setState(() {
                                              lengthValueDropdown=newValue;
                                            });
                                          },
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          },
                                          items:
                                          List.generate(50, (index) => '$index').map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.toString(),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    textDirection: TextDirection.rtl,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 3),
                                                          child: Text(
                                                            ('$value'),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black),
                                                            textAlign: TextAlign.right,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('length',style: TextStyle(

                                            color: Colors.black ,fontSize: 8

                                        ),),
                                      )
                                    ],
                                  ),


                                ],
                              ),
  ],
),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Send the Payment recipt of package ",style: TextStyle(
                                  color: Colors.black ,fontSize: 20
                              ),),


                              Container(
                                width: width*.4,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: primrycolor),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],),
                                child: Row(
                                  children: [
                                    Icon(Icons.add_a_photo_rounded,color:primrycolor),
                                    SizedBox(width: 10,),
                                    Text(
                                      "AddImage",
                                      style: TextStyle(
                                          color:primrycolor ,fontSize: 15
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),



                        ],
                      ),
                    ),
                  ],
                ),

              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: (){
              //  lengthValueDropdown==null?0:lengthValueDropdown
           int length=    int.parse(lengthValueDropdown??0);
           if(length>0){

           }
           // widget.price;
                //code
                Navigator.push(context, MaterialPageRoute(builder: (context)=>orderDetails(price: 30,)));

              },
              child: Container(
                width: size.width,
                height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff00FF88),
                              Color(0xff01DB91),
                              Color(0xff01BC98),
                            ]),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))),
                    child:Center(
                      child: Text(
                          "Calculate Price",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                      ),
                      ),
                    )
                ),
            ),

          ),

        ],
      ),
    );
  }



}


