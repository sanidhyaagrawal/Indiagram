import 'package:flutter/material.dart';
import 'login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    var _textStyleBlack = TextStyle(fontSize: 14.0, color: Colors.black);
    var _textStyleGrey = TextStyle(fontSize: 12.0, color: Colors.grey[500]);
    var _textStyleBlueGrey = TextStyle(
        fontSize: 12.0, color: Colors.blue[900], fontWeight: FontWeight.bold);
    var padd = MediaQuery.of(context).padding;

    _login() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50.0,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 1.1,
                  color: Colors.grey[350],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Already have an account? ",
                        style: _textStyleGrey
                    ),
                    FlatButton(
                      onPressed: _login,
                      child: Text(
                        'Log in',
                        style: _textStyleBlueGrey,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: new ScrollBehavior()
          ..buildViewportChrome(context, null, AxisDirection.down),
        child: SingleChildScrollView(
          child: Container(
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
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      isDense: true,
                    ),
                    style: _textStyleBlack,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You may receive SMS updates from Instagram and can opt out'
                          ' at any time',
                      style: _textStyleGrey,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                    onPressed: null,
                    color: Colors.blue,
                    disabledColor: Colors.lightBlue,
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
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
