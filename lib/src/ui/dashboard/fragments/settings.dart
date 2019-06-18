import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/dashboard/fragments/home.dart';


class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.home)),
              ],
            ),
            // title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Home(),
            ],
          ),
        ),
      ),
    );
  }
}
