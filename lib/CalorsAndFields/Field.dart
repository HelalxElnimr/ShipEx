import 'package:flutter/material.dart';

import 'ColorS.dart';
class Field extends StatelessWidget {
  Field(this.hintText, this.inputType,this.PrfixIcon,{this.isPasswordVisible=false, this.onTap,this.SufxIcon,this.textEditingController});
  final String hintText;
  final TextInputType inputType;
  final bool isPasswordVisible;
  final Function onTap;
  final IconData SufxIcon;
  final IconData PrfixIcon;
TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: textEditingController,

        style: TextStyle(
            color: primrycolor,letterSpacing: 0.2,height: 1.5,fontSize: 18),
        obscureText: isPasswordVisible,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: hintText,
          suffixIcon: IconButton(padding: EdgeInsets.only(right: 10),
            splashColor: Colors.transparent,
            onPressed: onTap,
            icon: Icon(SufxIcon,color: primrycolor,),
          ),
          prefixIcon: Icon(PrfixIcon,color: primrycolor,),
          contentPadding: EdgeInsets.only(),
          hintText: hintText,
          hintStyle: TextStyle(color: primrycolor,height: 1.5,fontSize: 15) ,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primrycolor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primrycolor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),


      ),
    );
  }
}