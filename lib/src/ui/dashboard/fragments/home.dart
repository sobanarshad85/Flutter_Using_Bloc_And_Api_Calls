import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeScreen createState() => new _HomeScreen();
}

class _HomeScreen extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Text("Home"),
        ),
      ),
    );
  }

}
