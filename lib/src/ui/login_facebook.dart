import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_movies/src/routes/navigation_router.dart';
import 'package:my_movies/src/ui/progile_screen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginPage extends StatefulWidget {  
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<LoginPage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

   bool isLoggedIn = false;
  var profileData;

  var facebookLogin = FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

Future<FirebaseUser> _signIn(BuildContext context) async {
  
   Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Sign in'),
        ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

  FirebaseUser userDetails = await _firebaseAuth.signInWithCredential(credential);
  ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData,
);

NavigationRouter.switchToLogin(context);
    // Navigator.push(
    //   context,
    //   new MaterialPageRoute(
    //     builder: (context) => new ProfileScreen(detailsUser: details),
    //   ),
    // );
    return userDetails;
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
             height:  MediaQuery.of(context).size.height,
                child: Image.network(
                   'https://images.unsplash.com/photo-1518050947974-4be8c7469f0c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
                   ,fit: BoxFit.fill,
                   color: Color.fromRGBO(255, 255, 255, 0.6),
                  colorBlendMode: BlendMode.modulate
                ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:10.0),
             Container(
                  width: 250.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(Icons.book,color: Color(0xffCE107C),),
                      SizedBox(width:10.0),
                      Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black,fontSize: 18.0),
                    ),
                    ],),
                    onPressed: () => _signIn(context)
                              .then((FirebaseUser user) => print('@@@@@@@@@@@@@ $user'))
                              .catchError((e) => print('@@@error@@@@ $e')),
                  ),
                )
                ),

                Container(
                  width: 250.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(Icons.face,color: Color(0xff4754de),),
                      SizedBox(width:10.0),
                      Text(
                      'Sign in with Facebook',
                      style: TextStyle(color: Colors.black,fontSize: 18.0),
                    ),
                    ],),
                    onPressed: () {
                      initiateFacebookLogin();
                    },
                  ),
                )
                ),
                Container(
                  width: 250.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(Icons.mail,color: Color(0xff4caf50),),
                      SizedBox(width:10.0),
                      Text(
                      'Sign in with Email',
                      style: TextStyle(color: Colors.black,fontSize: 18.0),
                    ),
                    ],),
                    onPressed: () {},
                  ),
                )
                ),
            ],
          ),
        ],
      ),),
    );
  }
   void initiateFacebookLogin() async {
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());

        NavigationRouter.switchToLogin(context);

        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }

  _displayUserData(profileData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                profileData['picture']['data']['url'],
              ),
            ),
          ),
        ),
        SizedBox(height: 28.0),
        Text(
          "Logged in as: ${profileData['name']}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }



  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }

}



class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}