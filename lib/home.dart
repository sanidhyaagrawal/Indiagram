import 'package:flutter/material.dart';
import 'package:Indiagram/signup_screen.dart';
import 'package:Indiagram/login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var padd = MediaQuery.of(context).padding;

    _signup() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignupScreen()
        ),
      );
    }

    _login() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()
        ),
      );
    }

    return Scaffold(
      body: ScrollConfiguration(
        behavior: new ScrollBehavior()
          ..buildViewportChrome(context, null, AxisDirection.down),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            height: MediaQuery.of(context).size.height -
                padd.top -
                padd.bottom -
                kToolbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 90.0, bottom: 25.0),
                  child: Text(
                    'Instagram',
                    style: TextStyle(
                      fontFamily: 'Billabong',
                      fontSize: 65.0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                    onPressed: _signup,
                    color: Colors.blue,
                    disabledColor: Colors.lightBlue,
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    onPressed: _login,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
