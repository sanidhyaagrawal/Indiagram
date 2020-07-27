import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Indiagram',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
              // ignore: deprecated_member_use
                title: TextStyle(color: Colors.black, fontFamily: "Aveny")
            ),
            // ignore: deprecated_member_use
            textTheme: TextTheme(title: TextStyle(color: Colors.black))
        ),
        /*home: FutureBuilder(
          //future: _repository.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.hasData) {
              return IndiaHomeScreen();
            }
            else {
              return LoginScreen();
            }
          },
        )*/
        home: Home()
    );
  }
}
