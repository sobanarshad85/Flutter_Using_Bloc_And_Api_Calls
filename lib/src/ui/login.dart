import 'package:flutter/material.dart';
import 'package:my_movies/src/routes/navigation_router.dart';
import './movie_list.dart';
import '../blocs/login_bloc.dart';

// void main() => runApp(new MyApp());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      // home: HomePage(),
      // theme: ThemeData(
      //   primarySwatch: Colors.teal,
      // ),
      // debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  
  changeThePage(BuildContext context, Bloc bloc) {
    final loginDetails = bloc.submit();
    print(loginDetails);
    NavigationRouter.switchToDashboard(context);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          labelText: "Email",
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.passwordChanged,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter password",
                          labelText: "Password",
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                      color: Colors.tealAccent,
                      onPressed: snapshot.hasData
                          ? () => changeThePage(context, bloc)
                          : () => changeThePage(context, bloc),
                      child: Text("Login"),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
               FlatButton(
                    onPressed: () {
                      NavigationRouter.switchToSignup(context);
                    },
                    child: Text("Don't have account yet? Signup here",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 16)),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
