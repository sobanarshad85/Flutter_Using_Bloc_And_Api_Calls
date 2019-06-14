import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_movies/src/routes/navigation_router.dart';
import 'package:my_movies/src/ui/movie_list.dart';
// import 'package:redeye/util/navigation_router.dart';
import 'fragments/home.dart';
import 'fragments/settings.dart';
import 'fragments/about.dart';
import 'fragments/contact.dart';
// import 'package:redeye/util/util.dart';

class Dashboard extends StatefulWidget {
  final drawerItems = getDrawerItems();
  @override
  _DashboardScreen createState() => new _DashboardScreen();
  static String heading = 'Dashboard';

//   String get token =>     // To ensure readonly

// Future<Null> setToken() async {
//   // set your _token here
// }

  static getDrawerItems() {
    return [
      new DrawerItem("Home", Icons.home),
      new DrawerItem("Setting", Icons.settings),
      new DrawerItem("About us", Icons.print),
      new DrawerItem("Contact us", Icons.contacts),
      new DrawerItem("Logout", Icons.exit_to_app)
    ];
  }
}

class _DashboardScreen extends State<Dashboard> {
  String avatar =
      "https://i1.wp.com/anderworx.com/wp-content/uploads/2018/09/cropped-Avatar-Round.png?w=512&ssl=1";
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(d.icon, color: Colors.deepPurple),
            title: new Text(d.title,
                style: new TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold)),
            selected: i == _selectedIndex,
            onTap: () => _onSelectItem(i),
          ),
          new Divider(
            color: Colors.deepPurple,
            height: 2.0,
          )
        ],
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Text('${Dashboard.heading}'),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Soban Arshad'),
              accountEmail: new Text('sobanarshad85'),
              currentAccountPicture: new CircleAvatar(
                maxRadius: 15,
                backgroundColor: Colors.transparent,
                child: new Center(
                  child: new Image.network(
                    avatar,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ),
            new Column(
              children: drawerOptions, //getDrawerItems(_selectedIndex),
            )
          ],
        ),
      ),
      body: _setDrawerItemWidget(_selectedIndex, context),
    );
  }

  _setDrawerItemWidget(int pos, BuildContext context) {
    switch (pos) {
      case 0:
        return new DashboardMovie();
      case 1:
        return new Settings();
      case 2:
        return new About();
      case 3:
        return new Contact();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop(); // close the drawer
    switch (index) {
      case 0:
        return Dashboard.heading = 'Home';
      case 1:
        return Dashboard.heading = 'Settings';
      case 2:
        return Dashboard.heading = 'About';
      case 3:
        return Dashboard.heading = 'Contacts';
      case 4:
        return toLogout();
      default:
        return new Text("Error");
    }
  }

  toLogout() {
    NavigationRouter.switchToLogin(context);
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
