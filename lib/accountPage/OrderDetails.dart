import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_new/CalorsAndFields/ColorS.dart';
import 'package:whatsapp_new/CalorsAndFields/Field.dart';
import 'package:whatsapp_new/accountPage/calculate_price.dart';
import 'package:whatsapp_new/accountPage/rate_dialog.dart';

class orderDetails extends StatefulWidget {
  int price;
  orderDetails({this.price});
  @override
  _orderDetailsState createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {


  TextEditingController _cardNumberController=TextEditingController();
  TextEditingController _expiryDateController=TextEditingController();
  TextEditingController _cardHolderNameController=TextEditingController();
  TextEditingController _cvvCodeController=TextEditingController();
  FocusNode cvvFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    //widget.price
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
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Time : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                Text('13:00   5/7/2021',style: TextStyle(fontSize: 18,color: primrycolor),),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Payment ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                Image.asset('assets/Path 3.png',width: 40,)
                              ],
                            ),

                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(vertical: 15,),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5,),

                                      decoration: BoxDecoration(
                                        border: Border.all(color: primrycolor,width: 2),
                                        borderRadius: BorderRadius.all(Radius.circular(20),),
                                        image: DecorationImage(image: AssetImage("assets/visa.png"))
                                      ),

                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5,),

                                      decoration: BoxDecoration(
                                          border: Border.all(color: primrycolor,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(20),),
                                        image: DecorationImage(image: AssetImage("assets/payPal.png"))
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5,),

                                      decoration: BoxDecoration(
                                          border: Border.all(color: primrycolor,width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(20),),

                                      ),
                                      child: Center(child: Text("Cash",style: TextStyle(
                                          color: primrycolor,fontWeight: FontWeight.bold,fontSize: 15
                                      ),),),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            PaymentInputs(),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);


                      },
                      child: Container(
                        width: (width/1.3)*.49,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22))

                        ),
                        child: Center(
                          child: Text("Cancel",style: TextStyle(
                          color: primrycolor,fontFamily: 'Raleway ',fontSize: 25
                          ),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RateScreen()));

                      },
                      child: Container(
                        width: (width/1.3)*.49,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: primrycolor,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(22))

                        ),
                        child: Center(
                          child: Text("Confirm",style: TextStyle(
                              color: Colors.white,fontFamily: 'Raleway ',fontSize: 25
                          ),textAlign: TextAlign.center,),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

      ),

    );
  }

  Widget PaymentInputs(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // LabelTitle("رقم بطاقة الائتمان"),
        rowTextField(controller:_cardNumberController,text_hint:'xxxx xxxx xxxx xxxx',labelText: "card number",type:TextInputType.number,maxLength: 16),
        // LabelTitle("اسم حامل البطاقة"),

        rowTextField(controller:_cardHolderNameController,text_hint:'name',labelText: "Name",type:TextInputType.text,maxLength:20),
        Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LabelTitle("تاريخ الانتهاء"),
                rowTextField(controller:_expiryDateController,text_hint:'MM/YY',labelText: "Expires",type:TextInputType.number,maxLength: 4),
              ],
            )),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // LabelTitle("رمز التحقق"),
                rowTextField(controller:_cvvCodeController,text_hint:'xxx',labelText: "CVC",type:TextInputType.text,maxLength: 3),
              ],
            )),
          ],
        ),

      ],
    );
  }
  Widget rowTextField({TextEditingController controller,String text_hint,String labelText,TextInputType type,int maxLength=30}){

    return Container(
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      //height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: primrycolor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        keyboardType: type,
        textDirection: TextDirection.rtl,
        controller: controller,
        cursorColor: primrycolor,
        //   maxLength: maxLength,
        maxLengthEnforced: true,
        decoration: new InputDecoration(

            hintText: text_hint,
            labelText: labelText,

            labelStyle: TextStyle(
              color: primrycolor,
              fontSize: 12,

            ),

            contentPadding: EdgeInsets.symmetric(vertical: 7,horizontal: 7),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(.74),
                    width: 0.0),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(.74),
                    width: 0.0),
                borderRadius: BorderRadius.circular(5)
            ),
            fillColor: Colors.black),
      ),
    );
  }

}
