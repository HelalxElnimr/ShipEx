import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:whatsapp_new/constantVariable.dart';


class Api{

  String endPoint="https://shipex.ahmedhesham.tech/api/v1/";

  Future register({
    String userName,
    String name,
    String phone,
    String password,
    File image,

  })
  async {


    var url ='${endPoint}user/register';
    print(url);
    var requestBody;

      requestBody = {
        'phone': phone,
        'username':userName,
        'password': password,
        'name':name,

      };
      print(requestBody);


    try {
      var response = await http.post(url,
          headers: {
            'Accept': 'application/json',
          },
          body: requestBody
      ).then ((http.Response response) async {


        final Map<String, dynamic> data = convert.json.decode(response.body);

        print("register");
        print(response.body);
        print(response.statusCode);
        if(response.statusCode==200){
          userToken=data['data']['token'];
        }

        return response.statusCode;
      });

      return response;
    }catch(e){
      print(e);
    }
  }

  Future login({String userName, String password})
  async {

    // final SharedPreferences prefs = await _prefs;

    var url ='${endPoint}user/login';
    var requestBody = {
      'username': userName,
      'password': password,
    };



    var statue=  await http.post(url,
        headers: {
          'Accept': 'application/json',
        },
        body: requestBody
    ).then(( responsedata) {
      print("login");
      print(responsedata.statusCode);
      print(responsedata.body);

      final Map<String, dynamic> data = convert.json.decode(responsedata.body);
      print(responsedata.body);

      if(responsedata.statusCode==200){
        userToken=data['data']['token'];

      }
      return  responsedata.statusCode;
      //data['token'];

    });
    return statue;

  }


}