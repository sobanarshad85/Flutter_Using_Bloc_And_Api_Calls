import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/movie_list.dart';
import 'package:my_movies/src/ui/signup.dart';

class NavigationRouter {
  static void switchToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/Login");
  }

  static void switchToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/LoginPage");
  }

  static void switchToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup()),
    );
  }

  static void switchToDashboard(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/Dashboard");
  }

  static void logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/");
  }
}

//Navigator.pushNamed(context, "/Login");
