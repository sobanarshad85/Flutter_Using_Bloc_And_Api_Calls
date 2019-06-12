import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutScreen createState() => new _AboutScreen();
}

class _AboutScreen extends State<About> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Text("About"),
        ),
      ),
    );
  }
}
