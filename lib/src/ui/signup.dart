import 'package:flutter/material.dart';
import 'package:my_movies/src/blocs/signup_block.dart';

class Signup extends StatelessWidget {
  const Signup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = SignupBloc();

    submissionIsReady(BuildContext context, SignupBloc bloc) {
      var check = bloc.submit();
      print(check);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
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
                stream: bloc.username,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.usernameChanged,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter username",
                          labelText: "Username",
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
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
                        hintText: 'Enter Password',
                        labelText: "Password",
                        errorText: snapshot.error,
                      ),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.age,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.ageChanged,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter age",
                          labelText: "Age",
                          errorText: snapshot.error),
                    ),
              ),
              RaisedButton(
                color: Colors.tealAccent,
                onPressed: () => submissionIsReady(
                      context,
                      bloc,
                    ),
                child: Text("Submit"),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                  stream: bloc.username,
                  builder: (context, snapshot) => Text('${snapshot.data}')),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                  stream: bloc.email,
                  builder: (context, snapshot) => Text('${snapshot.data}')),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                  stream: bloc.password,
                  builder: (context, snapshot) => Text('${snapshot.data}')),
              StreamBuilder<String>(
                  stream: bloc.age,
                  builder: (context, snapshot) => Text('${snapshot.data}')),
            ],
          ),
        ),
      ),
    );
  }
}
