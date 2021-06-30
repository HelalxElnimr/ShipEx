import 'package:flutter/material.dart';
import 'package:whatsapp_new/CalorsAndFields/ColorS.dart';

class orderDetails extends StatefulWidget {
  @override
  _orderDetailsState createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  @override
  Widget build(BuildContext context) {
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
            width: MediaQuery.of(context).size.width/1.3,
            height: MediaQuery.of(context).size.height/1.6,
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
              children: [
                SizedBox(height: 10,),

                Text("Order Details",style: TextStyle(
                  color: primrycolor,fontWeight: FontWeight.w400,fontSize: 25
                ),),
                Divider(
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                  thickness: 3,
                ),
                Text("Price : 30",style: TextStyle(
                    color: primrycolor,fontFamily: 'Raleway ',fontSize: 25
                ),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Time : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    Text('13:00   5/7/2021',style: TextStyle(fontSize: 18,color: primrycolor),),
                  ],
                )
              ],
            ),
          ),
        ),

      ),

    );
  }
}
