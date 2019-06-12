import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactScreen createState() => new _ContactScreen();
}

class _ContactScreen extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Text("Contact"),
        ),
      ),
    );
  }
}
