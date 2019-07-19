import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/utilities/api_Utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Authen{
  Future<bool> getToken(String email,String password) async {
    String URL = address + login;
    Map<String,String> user={
      'email': email,
      'password':password
  };
    var Response =await http.post(URL,body: user);
    if(Response.statusCode ==200){
      try {
        var json =jsonDecode(Response.body);
        var data =json['data'];
        var token =data['token'];
        SharedPreferences preferences =await SharedPreferences.getInstance();
        preferences.setString("token", token);
        return true;
      }catch(Exception){
        return false;
      }
    }

  }
}