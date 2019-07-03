import 'package:flutter/material.dart';
import 'package:flutter_app/models//pagemodular.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeScreen.dart';

class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

List<pagemodular> pages;

void _addpages() {
  pages = List<pagemodular>();
  pages.add(pagemodular(
      'assets/images/newsapp.png',
      'WELCOME',
      'This is welcome screen to welcome in our app. You can swip left and right to show another screens!  ',
      Icons.star));
  pages.add(pagemodular(
    'assets/images/newsapp1.jpg',
    'OUR DEVELOPER',
    'THIS IS THIRD STRING IN OUR description AND WELCOME :)',
    Icons.school,
  ));
  pages.add(
    pagemodular(
        'assets/images/newsapp2.png',
        'WELCOME',
        'THIS IS THIRD STRING IN OUR description AND WELCOME :)',
        Icons.ac_unit),
  );
}

ValueNotifier<int> indexPageNotifier = ValueNotifier<int>(0);

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    _addpages();

    return Stack(
      children: <Widget>[
        Scaffold(
            body: PageView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage(pages[index].image),
                    fit: BoxFit.cover,
                  )),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -70),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          pages[index].welcome,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
          itemCount: pages.length,
          onPageChanged: (index) {
            indexPageNotifier.value = index;
          },
        )),
        Transform.translate(
          offset: Offset(0, 60),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                drawpage_indiceater(pages.length),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
            child: SizedBox(
              child: RaisedButton(
                child: Text(
                  'Get Start',
                  style: TextStyle(letterSpacing: 1.25, color: Colors.white),
                ),
                color: Colors.red.shade600,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    _updateSeen();
                    return homeScreen();
                  }));
                },
              ),
              width: double.infinity,
              height: 50,
            ),
          ),
        )
      ],
    );
  }

  Widget drawpage_indiceater(int length) {
    return PageViewIndicator(
      pageIndexNotifier: indexPageNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
            size: 8.0,
            color: Colors.grey,
          ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.red,
            ),
          ),
    );
  }

  void _updateSeen() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen", true);

  }
}
