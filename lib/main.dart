import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homeScreen.dart';
import 'package:flutter_app/screens/welcomScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
main() async {
  Widget _screen;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  if (seen == false || seen == null)
    {
      _screen = welcomeScreen();
    }else{
    _screen = homeScreen();
  }
  runApp(newApp(_screen));
}

class newApp extends StatelessWidget {
  Widget _screen ;

  newApp(this._screen);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(primaryColor: Colors.red.shade600),
      home:_screen,
    );

  }
}
