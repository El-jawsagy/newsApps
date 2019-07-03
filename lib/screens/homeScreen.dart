import 'package:flutter/material.dart';
import 'package:flutter_app/screens/popMenuScreens/aboutScreen.dart';
import 'package:flutter_app/screens/popMenuScreens/contactScreen.dart';
import 'package:flutter_app/screens/popMenuScreens/helpScreen.dart';
import 'package:flutter_app/screens/popMenuScreens/settingScreen.dart';
import 'package:flutter_app/shared_ui/drawerNavigation.dart';
import 'home_screens/favoritTab.dart';
import 'home_screens/popularTab.dart';
import 'home_screens/whatsNewTab.dart';
class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

enum PopNavMenu { SETTING, HELP, CONTACT, ABOUT }

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {


  TabController _tabController;
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EXPLORE"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            _PopMeunNav(context),
          ],
          bottom: TabBar(
            tabs: [
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "WHAT's NEW ",
                      style: TextStyle(fontSize: 10),
                    ),
                    Icon(Icons.fiber_new),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "FAVORITE ",
                      style: TextStyle(fontSize: 10),
                    ),
                    Icon(Icons.favorite_border),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "POUPLER",
                      style: TextStyle(fontSize: 10),
                    ),
                    Icon(Icons.star),
                  ],
                ),
              ),
            ],
            controller: _tabController,
            indicatorColor: Colors.white,
          ),
        ),
        drawer: DrawerNavigation(),
        body: TabBarView(
          children: [
            WhatNew(),
            FavoriteTab(),
            PopularTab(),
          ],
          controller: _tabController,
        ));
  }

  Widget _PopMeunNav(BuildContext context) {
    return PopupMenuButton<PopNavMenu>(
      itemBuilder: (context) => <PopupMenuEntry<PopNavMenu>>[
            const PopupMenuItem<PopNavMenu>(
              value: PopNavMenu.SETTING,
              child: Text('SETTING'),
            ),
            const PopupMenuItem<PopNavMenu>(
              value: PopNavMenu.ABOUT,
              child: Text('ABOUT'),
            ),
            const PopupMenuItem<PopNavMenu>(
              value: PopNavMenu.CONTACT,
              child: Text('CONTACT'),
            ),
            const PopupMenuItem<PopNavMenu>(
              value: PopNavMenu.HELP,
              child: Text('HELP'),
            ),
          ],
      icon: Icon(Icons.more_vert),
      onSelected:(PopNavMenu menu) {
        switch(menu){
          case PopNavMenu.ABOUT:
            return Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutScreen();
            }));
            break;
          case PopNavMenu.HELP:
            return Navigator.push(context, MaterialPageRoute(builder: (context){
              return HelpScreen();
            }));
            break;
          case PopNavMenu.CONTACT:
            return Navigator.push(context, MaterialPageRoute(builder: (context){
              return ContactScreen();
            }));
            break;
          case PopNavMenu.SETTING:
            return Navigator.push(context, MaterialPageRoute(builder: (context){
              return SettingScreen();
            }));
            break;

        }
      },

    );
  }
}
