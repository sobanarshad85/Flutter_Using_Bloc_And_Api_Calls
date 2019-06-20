import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('demo.gawkat.com/info');

  String _message = "No messages yet...";

  @override
  void initState() {
    // fetch and change the message from the platform

    _getMessage().then((String message) {
      setState(() {
       _message = message;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(_message),
          )
        ],
      ),
    );
  }

  Future<String> _getMessage() async {
    var sendMap = <String, dynamic> {
      'from' : 'Soban',
    };

    String value;

    try {
      value = await platform.invokeMethod('getMessage', sendMap);
    } catch (e) {
      print(e);
    }

    return value;
  }
}