import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsScreen createState() => new _SettingsScreen();
}

class _SettingsScreen extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Text("Settings"),
        ),
      ),
    );
  }
}
