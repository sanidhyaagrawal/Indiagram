import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Indiagram/repository/user_repository.dart';
import 'package:Indiagram/auth/authentication_bloc.dart';
import 'package:Indiagram/login/bloc/login_bloc.dart';
import 'package:Indiagram/login/login_screen.dart';
import 'package:Indiagram/signup_screen.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var _textStyleGrey = TextStyle(fontSize: 12.0, color: Colors.grey[500]);
    var _textStyleBlueGrey = TextStyle(
        fontSize: 12.0, color: Colors.blue[900], fontWeight: FontWeight.bold);

    _signup() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignupScreen()),
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
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account? ", style: _textStyleGrey),
                      FlatButton(
                      onPressed: _signup,
                      child: Text(
                        'Sign up',
                        style: _textStyleBlueGrey,
                      ),
                    ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginScreen(),
      ),
    );
  }
}
