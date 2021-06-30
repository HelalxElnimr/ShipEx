import 'package:flutter/material.dart';
import 'package:whatsapp_new/CalorsAndFields/ColorS.dart';
import 'package:whatsapp_new/CalorsAndFields/Field.dart';
import 'package:whatsapp_new/Core/service/Api.dart';
import 'package:whatsapp_new/ScreensApp/HomePage.dart';
import 'package:whatsapp_new/accountPage/LoginScreen.dart';



class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {



  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();


  @override
  bool isPasswordVisible = true;
  bool chekboxis = true;
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Center(child:
          SingleChildScrollView(
           child: Column(children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            //LOGO
            Container(height: 150,width: 150,
              child:
             Image.asset("assets/LOGOcolor.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/90,),
             Container(
               child: Text("Let's Get Start !",style: TextStyle(fontFamily: 'Raleway',
                   fontSize: 35,fontWeight: FontWeight.bold,color: primrycolor),),
             ),
            SizedBox(height: MediaQuery.of(context).size.height/90,),
            //Login to your account
            Container(
              child: Text("Enter your information to allow.",style: TextStyle(fontFamily: 'Raleway',
                  fontSize: 16,color: Color(0xff8EDEC5)),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
             Field('User Name',TextInputType.name,Icons.account_circle,SufxIcon: null,textEditingController:userNameController,),
             SizedBox(height: MediaQuery.of(context).size.height/40,),

             Field('Name',TextInputType.name,Icons.account_circle,SufxIcon: null,textEditingController: nameController,),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            //Phone Number
            Field('Phone number',TextInputType.phone,Icons.account_circle,SufxIcon: null,textEditingController: phoneController,),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            //Password
            Field('Password',TextInputType.visiblePassword,Icons.https,isPasswordVisible: isPasswordVisible,
              onTap: (){
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });}
              ,SufxIcon:
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              textEditingController: passwordController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
             Field('Confirm Password',TextInputType.visiblePassword,Icons.https,isPasswordVisible: isPasswordVisible,
               onTap: (){
                 setState(() {
                   isPasswordVisible = !isPasswordVisible;
                 });}
               ,SufxIcon:
               isPasswordVisible ? Icons.visibility : Icons.visibility_off,
               textEditingController: confirmPasswordController,
             ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            //LOGIN
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
              child:GestureDetector(
                onTap: (){

                  Api api=Api();
                  api.register(name:nameController.text,phone: phoneController.text,password: passwordController.text,userName: userNameController.text ).then((value){
                    if(value==200){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }

                  });

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff01A79C),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          color: primrycolor,
                          width: 1
                      )
                  ),
                  child: Center(child: Text("Register",style: TextStyle(
                      color: Colors.white,fontSize: 23
                  ),),),
                ),
              )
              ,),
             SizedBox(height: MediaQuery.of(context).size.height/40,),
             Text("Alrady have an account ?",style: TextStyle(color: primrycolor),),
             SizedBox(height: MediaQuery.of(context).size.height/40,),
            //Register
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GestureDetector(
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: gredintcolorapp,
                  child: Center(
                    child: Text("LOGIN",style: TextStyle(
                      color: Colors.white,fontSize: 25,
                    ),),
                  ),
                ),
              ),
            ),
          ],
          ),
        ),
        )
    );
  }
}
