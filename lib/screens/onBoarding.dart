import 'package:flutter/material.dart';
import 'package:flutter_app/models//pagemodular.dart';
class onBording extends StatefulWidget {
  @override
  _onBordingState createState() => _onBordingState();
}

class _onBordingState extends State<onBording> {
  void _addpage() {
    page= List<pagemodular>();
    page.add(
      pagemodular(
          'assets/images/newsapp.png',
          'WELCOME',
          'This is welcome screen to welcome in our app. You can swip left and right to show another screens!  ',
          Icons.star),
    );

    page.add(
      pagemodular(
        'assets/images/newsapp1.jpg',
        'OUR DEVELOPER',
        'THIS IS THIRD STRING IN OUR description AND WELCOME :)',
        Icons.school,
      ),
    );

    page.add(
      pagemodular(
          'assets/images/newsapp2.png',
          'WELCOME',
          'THIS IS THIRD STRING IN OUR description AND WELCOME :)',
          Icons.ac_unit),
    );
  }

  List<pagemodular> page ;
  @override
  Widget build(BuildContext context) {
    _addpage();
    return Stack(
      children: <Widget>[
        /*widget make me can swipe more one time have a properties itemBuilder:
        it take BuildContext context to know where it display and index of display*/
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(page[index].image),
                            fit: BoxFit.cover)),
                  ),
                  Center(
                    child: Column(
                      // use to make a widget alignment to and side
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //change width and height as i like
                        Transform.translate(
                          child: Icon(
                            page[index].icon,
                            size: 150,
                            color: Colors.white,
                          ),
                          //this is function to change
                          offset: Offset(0, -75),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            page[index].welcome,
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            page[index].description,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
            itemCount: page.length,
          ),
        ),
        Transform.translate(
          offset: Offset(0, 62),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _drawpageindeicators(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: SizedBox(
              //button
              child: RaisedButton(
                child: Text(
                  'GET STARED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.25,
                  ),
                ),
                color: Colors.red,
                onPressed: () {},
              ),
              width: double.infinity,
              height: 50,
            ),
          ),
        )
      ],
    );
  }
  List<Widget> _drawpageindeicators() {
    List<Widget> _widgets = List<Widget>();
    for (var i in page) {
      _widgets.add(_circle(Colors.red));
    }

    return _widgets;
  }

  Widget _circle(Color newcolor) {
    return Container(
      width: 10,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(shape: BoxShape.circle, color: newcolor),
    );
  }
}
