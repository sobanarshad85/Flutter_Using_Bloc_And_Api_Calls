import 'package:my_movies/src/routes/route.dart';

void main() => new Routes();

// // import 'dart:async';
// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // // import './models/user.dart';
// // import 'package:my_movies/src/models/item_model.dart';

// // // import './models/users.dart';

// // // Future<Users> fetchPost() async {
// // //   final response =
// // //       await http.get('https://jsonplaceholder.typicode.com/users');

// // //   if (response.statusCode == 200) {
// // //     // If the call to the server was successful, parse the JSON.
// // //     print(response.body);
// // //     return Users.fromJson(json.decode(response.body));
// // //   } else {
// // //     // If that call was not successful, throw an error.
// // //     throw Exception('Failed to load post');
// // //   }
// // // }

// // final String jsonplaceholder = "http://jsonplaceholder.typicode.com/users/";

// // //Future method to read the URL
// // Future<User> fetchPost() async {
// //   final response = await http.get(jsonplaceholder);
// //   final jsonresponse = json.decode(response.body);

// //   Iterable list = json.decode(response.body);
// //   MyApp.users = list.map((user) => User.fromJson(user)).toList();
// //   print(MyApp.users);
// //   // print(jsonresponse);

// //   // this line is just returning, actual work is happening in above lines
// //   return User.fromJson(jsonresponse[0]);
// // }

// // // class Post {
// // //   final int userId;
// // //   final int id;
// // //   final String title;
// // //   final String body;

// // //   Post({this.userId, this.id, this.title, this.body});

// // //   factory Post.fromJson(Map<String, dynamic> json) {
// // //     return Post(
// // //       userId: json['userId'],
// // //       id: json['id'],
// // //       title: json['title'],
// // //       body: json['body'],
// // //     );
// // //   }
// // // }

// // void main() => runApp(MyApp(user: fetchPost()));

// // class MyApp extends StatelessWidget {
// //   final Future<User> user;
// //   static var users = new List<User>();
// //   MyApp({Key key, this.user}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Fetch Data Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Fetch Data Example'),
// //         ),
// //         body: Center(
// //           child: FutureBuilder<User>(
// //             future: user,
// //             builder: (context, snapshot) {
// //               if (snapshot.hasData) {
// //                 return buildList(snapshot);
// //               } else if (snapshot.hasError) {
// //                 return Text("@@@@@@@@@@@@@@@@@@@ ${snapshot.error}");
// //               }

// //               // By default, show a loading spinner.
// //               return CircularProgressIndicator();
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildList(AsyncSnapshot<User> snapshot) {
// //     return Center(
// //         child: ListView.builder(
// //       itemCount: users.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //             title: Column(
// //           children: <Widget>[
// //             Text(users[index].id.toString()),
// //             Text(users[index].username.toString()),
// //             Text(users[index].name.toString()),
// //             Text(users[index].email.toString()),
// //             Text(users[index].website.toString()),
// //             Text(users[index].address.street.toString()),
// //             Text(users[index].address.city.toString()),
// //             Text(users[index].phone.toString()),
// //             SizedBox(
// //               height: 10.0,
// //             )
// //           ],
// //         ));
// //       },
// //     ));
// //   }

// //   getIt(snapshot) {
// //     print(snapshot);
// //     return 'hey';
// //   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(LoginPage());
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool isLoggedIn = false;
//   var profileData;

//   var facebookLogin = FacebookLogin();

//   void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
//     setState(() {
//       this.isLoggedIn = isLoggedIn;
//       this.profileData = profileData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Facebook Login"),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.exit_to_app,
//                 color: Colors.white,
//               ),
//               onPressed: () => facebookLogin.isLoggedIn
//                   .then((isLoggedIn) => isLoggedIn ? _logout() : {}),
//             ),
//           ],
//         ),
//         body: Container(
//           child: Center(
//             child: isLoggedIn
//                 ? _displayUserData(profileData)
//                 : _displayLoginButton(),
//           ),
//         ),
//       ),
//     );
//   }

//   void initiateFacebookLogin() async {
//     var facebookLoginResult =
//         await facebookLogin.logInWithReadPermissions(['email']);

//     switch (facebookLoginResult.status) {
//       case FacebookLoginStatus.error:
//         onLoginStatusChanged(false);
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         onLoginStatusChanged(false);
//         break;
//       case FacebookLoginStatus.loggedIn:
//         var graphResponse = await http.get(
//             'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult
//                 .accessToken.token}');

//         var profile = json.decode(graphResponse.body);
//         print(profile.toString());

//         onLoginStatusChanged(true, profileData: profile);
//         break;
//     }
//   }

//   _displayUserData(profileData) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Container(
//           height: 200.0,
//           width: 200.0,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(
//                 profileData['picture']['data']['url'],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 28.0),
//         Text(
//           "Logged in as: ${profileData['name']}",
//           style: TextStyle(
//             fontSize: 20.0,
//           ),
//         ),
//       ],
//     );
//   }

//   _displayLoginButton() {
//     return RaisedButton(
//       child: Text("Login with Facebook"),
//       onPressed: () => initiateFacebookLogin(),
//     );
//   }

//   _logout() async {
//     await facebookLogin.logOut();
//     onLoginStatusChanged(false);
//     print("Logged out");
//   }
// }