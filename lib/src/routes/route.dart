import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/dashboard/dashboard.dart';
import 'package:my_movies/src/ui/login.dart';
import 'package:my_movies/src/ui/movie_list.dart';
import 'package:my_movies/src/ui/signup.dart';
// import 'screens/splash/splash.dart';
// import 'screens/test/test_Post.dart';
// import 'screens/test/test_Get.dart';
// import 'screens/test/test_Form.dart';
// import 'screens/test/test_graphQl.dart';
// import 'screens/login/login.dart';
// import 'screens/signup/signup.dart';
// import 'screens/dashboard/dashboard.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => Login(),
    "/Dashboard": (BuildContext context) => Dashboard(),
    "/Signup":(BuildContext context)=> Signup(),
  };

  Routes() {
    runApp(
      new MaterialApp(
        title: 'RedEye',
        routes: routes,
        home: Login(), //Splash(), //Dashboard(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            primarySwatch: Colors.deepPurple,
            primaryColorDark: Colors.deepPurple),
      ),
    );
  }
}
