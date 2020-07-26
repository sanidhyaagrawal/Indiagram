import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Indiagram/india_home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userId = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _showpassword = false;

  /*final _formKey = GlobalKey<FormState>();
  String _email, _password;*/

  /*_submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Logging in the user w/ Firebase
      //AuthService.login(_email, _password);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    var _textStyleBlack = TextStyle(
        fontSize: 14.0, color: Colors.black);
    var _textStyleGrey = TextStyle(fontSize: 12.0, color: Colors.grey[500]);
    var _textStyleBlueGrey = TextStyle(
        fontSize: 12.0, color: Colors.blue[900], fontWeight: FontWeight.bold);
    var padd = MediaQuery.of(context).padding;
    bool _isEnabled = false;

    _showEmptyDialog(String title) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            "Error",
            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "$title can't be empty",
            style: TextStyle(color: Colors.black38, fontSize: 13),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Dismiss",
                style: TextStyle(color: Colors.blueAccent),
                )
            )
          ],
        ),
      );
    }

    _enablebtn() {
      if (_userId.text.isEmpty || _password.text.isEmpty) {
        setState( () {
          _isEnabled = false;
        }
        );
      } else {
        setState( () {
          _isEnabled = true;
        }
        );
      }
    }

    _login() {
      if (_userId.text.isEmpty || _password.text.isEmpty) {
        _showEmptyDialog("Type something");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IndiaHomeScreen()
          ),
        );
      }
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
                Padding(
                  padding: EdgeInsets.only(top: 17.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account? ", style: _textStyleGrey),
                      Text('Sign up.', style: _textStyleBlueGrey),
                    ],
                  ),
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
                  child: TextField(
                    controller: _userId,
                    onChanged: _enablebtn(),
                    decoration: InputDecoration(
                      hintText: 'Phone number, email or username',
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
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: TextField(
                    controller: _password,
                    onChanged: _enablebtn(),
                    obscureText: !this._showpassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white10,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: this._showpassword
                              ? Colors.black
                              : Colors.black12,
                        ),
                        onPressed: () {
                          setState(() {
                            this._showpassword = !this._showpassword;
                          });
                        },
                      ),
                      isDense: true,
                    ),
                    style: _textStyleBlack,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                    onPressed: _isEnabled ? () => _login() : null,
                    color: Colors.blue,
                    disabledColor: Colors.lightBlueAccent,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Forgot your login details?',
                      style: _textStyleGrey,
                    ),
                    FlatButton(
                      onPressed: null,
                      padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                      child: Text(
                        'Get help signing in.',
                        style: _textStyleBlueGrey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 1.0,
                      width: MediaQuery.of(context).size.width / 2.7,
                      color: Colors.grey[350],
                    ),
                    Text(
                      '  OR  ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      height: 1.0,
                      width: MediaQuery.of(context).size.width / 2.7,
                      color: Colors.grey[350],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    onPressed: null,
                    child: Text(
                      "Log in with Facebook",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                /*Form(
							key: _formKey,
							child: Column(
								mainAxisSize: MainAxisSize.min,
								children: <Widget>[
								Padding(
									padding: EdgeInsets.symmetric(
									horizontal: 30.0,
									vertical: 10.0,
									),
									child: TextFormField(
									decoration: InputDecoration(labelText: 'Email'),
									validator: (input) => !input.contains('@')
										? 'Please enter a valid email'
										: null,
									onSaved: (input) => _email = input,
									),
								),
								Padding(
									padding: EdgeInsets.symmetric(
									horizontal: 30.0,
									vertical: 10.0,
									),
									child: TextFormField(
									decoration: InputDecoration(labelText: 'Password'),
									validator: (input) => input.length < 6
										? 'Must be at least 6 characters'
										: null,
									onSaved: (input) => _password = input,
									obscureText: true,
									),
								),
								SizedBox(height: 20.0),
								Container(
									width: 250.0,
									child: FlatButton(
									onPressed: _submit,
									color: Colors.blue,
									padding: EdgeInsets.all(10.0),
									child: Text(
										'Login',
										style: TextStyle(
										color: Colors.white,
										fontSize: 18.0,
										),
									),
									),
								),
								SizedBox(height: 20.0),
								Container(
									width: 250.0,
									child: FlatButton(
									onPressed: () =>
										Navigator.pushNamed(context, SignupScreen.id),
									color: Colors.blue,
									padding: EdgeInsets.all(10.0),
									child: Text(
										'Go to Signup',
										style: TextStyle(
										color: Colors.white,
										fontSize: 18.0,
										),
									),
									),
								),
								],
							),
							),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
