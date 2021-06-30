import 'package:flutter/material.dart';

import 'Color.dart';

class ButtonClickBorder extends StatelessWidget {
  ButtonClickBorder(this.TextButton,this.onTap,{this.ButtonColorBorder,this.ButtonColor});
  final String TextButton;
  final Function onTap;
  final Color ButtonColorBorder ;
  final Color ButtonColor ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: MediaQuery.of(context).size.height/15,
        width: MediaQuery.of(context).size.height/3,
        child: Center(
            child: Text(TextButton,style: TextStyle(fontFamily: 'Raleway',
                fontSize: 16,color: primrycolor),)),
        decoration: BoxDecoration(
            color:ButtonColor ,
            border: Border.all(color: Color(4294967295),),borderRadius: BorderRadius.circular(20) ),
      )
    );
  }
}