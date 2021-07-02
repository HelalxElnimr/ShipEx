import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:whatsapp_new/CalorsAndFields/ColorS.dart';
import 'package:whatsapp_new/CalorsAndFields/Field.dart';
import 'package:whatsapp_new/ScreensApp/order_list_shipment.dart';
import 'package:whatsapp_new/accountPage/calculate_price.dart';

class RateScreen extends StatefulWidget {
  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {


  var rating = 0.0;



  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/backgrund.png"),
          ),
        ),
        child: Center(
          child: Container(
            width: width/1.3,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Rate The Drive",
                    style: TextStyle(
                      color: primrycolor,
                      fontSize: 20
                    ),
                  ),
                ),
              SmoothStarRating(
              rating: rating,
              isReadOnly: false,
              size: width*.1,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              spacing: 2.0,
              onRated: (value) {
                print("rating value -> $value");
                // print("rating value dd -> ${value.truncate()}");
              },

            ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShipmentOrderList()));
                  },
                  child: Container(
                    width: width*.3,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
                    child: Center(
                      child: Text("Done"),
                    ),
                  ),
                )
              ]
            )
          ),
        ),

      ),

    );
  }


}
