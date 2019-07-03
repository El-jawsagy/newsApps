import 'package:flutter/material.dart';
import 'package:flutter_app/models/nav_model.dart';
import 'package:flutter_app/screens/homeScreen.dart';
import 'package:flutter_app/screens/instgramFeedsScreen.dart';
import 'package:flutter_app/screens/popMenuScreens/settingScreen.dart';
import 'package:flutter_app/screens/twitterFeedsScreen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

List<nav_Model> _listDrawerNav = [
  nav_Model(
    "Explore",
    () => homeScreen(),
    Icons.home,
  ),
  nav_Model(
    "Instagram Feeds",
    () => InstagramFeeds(),
    Icons.image,
  ),
  nav_Model(
    "Setting",
    () => SettingScreen(),
    Icons.settings,
  ),
  nav_Model(
    "Twitter Feeds",
    () => twitterFeeds(),
    Icons.person_pin,
  ),
  nav_Model(
    "Logout",
    () => homeScreen(),
    Icons.exit_to_app,
  ),
];

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _listDrawerNav[position].title,
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 18),
                    ),
                  ),
                ),
                trailing: Transform.translate(
                  offset: Offset(0, 8),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ),
                leading: Transform.translate(
                    offset: Offset(0, 10),
                    child: Icon(
                      _listDrawerNav[position].iconDataNav,
                      color: Colors.grey,
                    )),
                onTap: () {
                  Navigator.pop(context);
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return _listDrawerNav[position].diractor();
                  }));
                });
          },
          itemCount: _listDrawerNav.length,
        ),
      ),
    );
  }
}
