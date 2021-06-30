import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_new/CalorsAndFields/ColorS.dart';
import 'package:whatsapp_new/CalorsAndFields/Field.dart';
import 'package:whatsapp_new/ScreensApp/HomePage.dart';
import 'package:whatsapp_new/accountPage/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isPasswordVisible = true;
  bool chekboxis = true;
  int selectedRadio;
  void initState(){
    super.initState();
    selectedRadio=1;
  }
setSelectedRadio(int valu){
    setState(() {
      selectedRadio=valu;
    });
}
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          //LOGO
          Container(
            child: SvgPicture.asset("assets/LogoColor.svg"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //Welcome Back
          Container(
            child: Text(
              "Welcome Back !",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: primrycolor),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          //Login to your account
          Container(
            child: Text(
              "Login to your account to allow.",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  color: Color(0xff8EDEC5)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          //Phone Number
          Field(
            'Phone number',
            TextInputType.phone,
            Icons.account_circle,
            SufxIcon: null,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          //Password
          Field(
            'Password',
            TextInputType.visiblePassword,
            Icons.https,
            isPasswordVisible: isPasswordVisible,
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            SufxIcon:
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          //Remember Me and forgot password
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//              Checkbox(value: chekboxis, onChanged: (bool newvalue){
//                setState(() { chekboxis =newvalue;}
//                );
//                Text("Remember me");
//                },
//                activeColor: primrycolor,
//              hoverColor: primrycolor,
//              focusColor: Colors.blue,
//              checkColor: Colors.red,
//              tristate: false,
//              splashRadius: 0.5,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chekboxis = !chekboxis;
                    });
//                );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: chekboxis ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: primrycolor, width: 1)),
                    width: 20,
                    height: 20,
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: chekboxis ? Colors.white : primrycolor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Remember me",
                  style: TextStyle(color: primrycolor, fontSize: 14),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  splashColor: Colors.black12,
                  onTap: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>sendValidation()));
                  },
                  child: Text(
                    "Fogot PassWord ?",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14,
                        color: primrycolor),
                  ),
                ),
              ],
            ),
          ),
          // Radio button---------------------------------------------------
          Center(
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Radio(value: 1,
                    groupValue: selectedRadio,
                    activeColor: primrycolor,
                    onChanged: (valu){
                  print(valu);
                  setSelectedRadio(valu);
                }),
                Text("User",style: TextStyle(fontSize: 18,color: primrycolor,fontFamily: 'Raleway'),),
                SizedBox(
                  width: 20,
                ),
                Radio(value: 2,
                    groupValue: selectedRadio,
                    activeColor: primrycolor,
                    hoverColor: primrycolor,
                    focusColor: primrycolor,
                    onChanged: (valu){
                      print(valu);
                      setSelectedRadio(valu);
                    }),
                Text("Driver",style: TextStyle(fontSize: 18,color: primrycolor,fontFamily: 'Raleway'),),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          //LOGIN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: gredintcolorapp,
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          //Register
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: primrycolor, width: 1)),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(color: primrycolor, fontSize: 23),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    )
    );
  }
}
