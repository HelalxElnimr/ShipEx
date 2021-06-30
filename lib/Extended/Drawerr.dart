import 'package:flutter/material.dart';
import 'package:whatsapp_new/ScreensApp/MapScreen.dart';
import 'package:whatsapp_new/accountPage/LoginScreen.dart';

import 'Color.dart';

class Drawerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("Mohamed_Helal@yaho.com"),
            accountName: Text("Mohamed Helal"),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset("assets/avatar.png"),
              )
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/mask.png"), fit: BoxFit.fill)),
          ),
          ListTile(
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBarV2()),
            );},
            selected: true,
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway'),
            ),
            leading: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            contentPadding: EdgeInsets.only(left: 25,top: 0),
          ),
          ListTile(
            onTap: () {},
            selected: true,
            title: Text(
              "Contact Us",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  ),
            ),
            leading: Icon(Icons.person_outline, color: Colors.white, size: 30),
            contentPadding: EdgeInsets.only(left: 25,top: 0),
          ),
          SizedBox(
            height: 270,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "About Us",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  ),
            ),
            contentPadding: EdgeInsets.only(top: 0, left: 25),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            contentPadding: EdgeInsets.only(top: 0, left: 25),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            title: Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            leading: Icon(Icons.exit_to_app, color: Colors.white, size: 25),
            contentPadding: EdgeInsets.only(top: 60, left: 25),
          ),
        ],
      ),
    );
  }
}
