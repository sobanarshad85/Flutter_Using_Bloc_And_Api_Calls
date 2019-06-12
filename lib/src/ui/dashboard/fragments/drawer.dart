import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {
  @override
  _DrawerView createState() => new _DrawerView();
}

class _DrawerView extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    drawerOptions.add(getDrawerItem("About Us"));
    drawerOptions.add(getDrawerItem("Contact Us"));
    drawerOptions.add(getDrawerItem("Settings"));

    return new Scaffold(
      body: new Container(
          child: new ListView(
        children: <Widget>[
          new Column(
            children: drawerOptions,
          )
        ],
      )),
    );
  }

  getDrawerItem(text) {
    return new Column(children: <Widget>[
      new Column(
        children: <Widget>[
          new Text(
            text,
            style: new TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          new Divider(
            color: Colors.deepPurple,
            height: 2.0,
          )
        ],
      )
    ]);
  }
}
