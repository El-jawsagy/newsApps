import 'package:flutter/material.dart';
import 'package:flutter_app/shared_ui/drawerNavigation.dart';
class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      drawer: DrawerNavigation(),
    );
  }
}
