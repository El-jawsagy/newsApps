import 'package:flutter/material.dart';
import 'package:flutter_app/apis/Authentication.dart';

import 'homeScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

TextEditingController _emailController, _passwordController;
String email, password;

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Authen authen = Authen();
  bool loginError = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: false,
      ),
      body: Form(
          key: _formKey, child: (isLoading) ? _drawIndecator() : _drawForm()),
    );
  }

  Widget _drawIndecator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _drawForm() {
    if (loginError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("login error"),
            RaisedButton(
              color: Colors.red.shade600,
              onPressed: () {
                setState(() {
                  loginError = false;
                });
              },
              child: Text(
                "Try Again",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: "email",
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Enter Your Email please';
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: "password",
          ),
          controller: _passwordController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Enter Your password please';
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 40,
          child: RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  return isLoading = false;
                });
                email = _emailController.text;
                password = _passwordController.text;
                var response = await authen.getToken(email, password);
                if (response) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return homeScreen();
                  }));
                } else {
                  setState(() {
                    loginError = true;
                  });
                }
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red.shade600,
          ),
        )
      ],
    );
  }
}
